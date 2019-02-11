//
//  MovieDetailsViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: BaseViewController<MovieDetailsView> {
    
    private var movie: Movie
    private let viewModel: MovieDetailsViewable
    private let configuration: Configurable
    
    private lazy var tableView = mainView.tableView
    private lazy var titleLabel = mainView.titleLabel
    private lazy var backdropImageView = mainView.backdropImageView
    
    private let viewDataManager: MovieDetailsTableViewDataManager
    
    // MARK: - Initialization
    required init(for movie: Movie,
                  with configuration: Configurable,
                  viewModel: MovieDetailsViewable,
                  viewDataManager: MovieDetailsTableViewDataManager) {
        self.viewModel = viewModel
        self.movie = movie
        self.configuration = configuration
        self.viewDataManager = viewDataManager
        super.init()
    }
    
    convenience init(for movie: Movie,
                     with configuration: Configurable) {
        self.init(for: movie,
                  with: configuration,
                  viewModel: MovieDetailsViewModel(),
                  viewDataManager: MovieDetailsTableViewDataManager())
    }

    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupView()
        update(with: movie)
        viewModel.fetchMovieDetails(for: movie.id)
    }
    
    private func bindViewModel() {
        viewModel.movie.bind { [weak self] movie in
            guard let movie = movie else { return }
            self?.movie = movie
            self?.update(with: movie)
        }
    }
    
    private func setupView() {
        viewDataManager.setup(tableView: tableView)
    }
    
    private func update(with movie: Movie) {
        DispatchQueue.main.async { [weak self] in
            var title = movie.title
            if let year = movie.releaseDate.split(separator: "-").first {
                title = "\(title) \n(\(year))"
            }
            self?.titleLabel.text = title
        }
        
        let image = (size: Images.Size.w300, url: configuration.images.secureBaseUrl)
        if let backdropPath = movie.backdropPath,
            let url = URL(string: image.url + image.size.name + backdropPath) {
            DispatchQueue.main.async { [weak self] in
                self?.backdropImageView.kf.setImage(with: url)
            }
        }
        
        let movieDetails = viewModel.getMovieDetails(with: movie)
        var imageUrl: URL?
        if let posterPath = movie.posterPath {
            imageUrl = URL(string: image.url + image.size.name + posterPath)
        }
        
        viewDataManager.setMovieDetailsModel(movieDetails, imageUrl: imageUrl)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        mainView.updateConstraints(for: UIDevice.current.orientation)
    }
}
