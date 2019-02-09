//
//  MoviesViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

class MoviesViewController: BaseViewController<MoviesView> {
    
    private let configuration: Configurable
    private let moviesViewModel: MoviesViewable
    private let genresViewModel: GenresViewable

    private lazy var collectionView = mainView.collectionView
    private let viewDataManager: MoviesCollectionViewDataManager
    
    // MARK: - Initialization
    required init(configuration: Configurable,
                  moviesViewModel: MoviesViewable,
                  genresViewModel: GenresViewable,
                  viewDataManager: MoviesCollectionViewDataManager) {
        self.configuration = configuration
        self.moviesViewModel = moviesViewModel
        self.genresViewModel = genresViewModel
        self.viewDataManager = viewDataManager
        super.init()
    }
    
    convenience init(with configuration: Configurable) {
        self.init(configuration: configuration,
                  moviesViewModel: MoviesViewModel(),
                  genresViewModel: GenresViewModel(),
                  viewDataManager: MoviesCollectionViewDataManager(with: configuration))
    }
    
    // MARK: - Setup & Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        genresViewModel.fetchGenres()
        moviesViewModel.fetchMovies(page: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Upcomming Movies"
    }
    
    private func bindViewModel() {
        genresViewModel.genres.bind { [weak self] genres in
            guard let self = self else { return }
            self.viewDataManager.setGenresModel(genres)
        }
        
        moviesViewModel.movies.bind { [weak self] movies in
            guard let self = self else { return }
            self.viewDataManager.updateMoviesModel(with: movies)
        }
    }
    
    private func setupView() {
        viewDataManager.delegate = self
        viewDataManager.setup(collectionView: collectionView)
    }
}

// MARK: - MoviesSearchResultsDelegate
extension MoviesViewController: MoviesCollectionViewDelegate {
    func moviesCollectionView(didSelectItemAt indexPath: IndexPath) {
        guard let movie = viewDataManager.getModel(for: indexPath) else { return }
        let movieDetailsViewController = MovieDetailsViewController(for: movie, with: configuration)
        title = ""
        navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Do something
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if (scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            let currentPage: Int = viewDataManager.totalItems / moviesViewModel.resultsPerPage
            moviesViewModel.fetchMovies(page: currentPage + 1)
        }
    }
}
