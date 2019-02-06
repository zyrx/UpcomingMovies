//
//  MoviesViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class MoviesViewController: BaseViewController<MoviesView> {
    
    private let moviesViewModel: MoviesViewable
    private let genresViewModel: GenresViewable

    private lazy var collectionView = mainView.collectionView
    private let viewDataManager: MoviesCollectionViewDataManager
    
    // MARK: - Initialization
    required init(moviesViewModel: MoviesViewable,
                  genresViewModel: GenresViewable,
                  viewDataManager: MoviesCollectionViewDataManager) {
        self.moviesViewModel = moviesViewModel
        self.genresViewModel = genresViewModel
        self.viewDataManager = viewDataManager
        super.init()
    }
    
    override convenience init() {
        self.init(moviesViewModel: MoviesViewModel(),
                  genresViewModel: GenresViewModel(),
                  viewDataManager: MoviesCollectionViewDataManager())
    }
    
    // MARK: - Setup & Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upcomming Movies"
        setupTableView()
        bindViewModel()
        genresViewModel.fetchGenres()
        moviesViewModel.fetchMovies(page: 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func bindViewModel() {
        genresViewModel.genres.bind { [weak self] genres in
            guard let self = self else { return }
            self.viewDataManager.setGenresModel(genres)
        }
        
        moviesViewModel.movies.bind { [weak self] movies in
            guard let self = self else { return }
            self.viewDataManager.setMoviesModel(movies)
        }
    }
    
    private func setupTableView() {
        viewDataManager.delegate = self
        viewDataManager.setup(collectionView: collectionView)
    }
}

// MARK: - MoviesSearchResultsDelegate
extension MoviesViewController: MoviesSearchResultsDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Do something
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Do something
    }
}
