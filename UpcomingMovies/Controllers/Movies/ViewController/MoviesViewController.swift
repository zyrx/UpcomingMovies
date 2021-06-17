//
//  MoviesViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

class MoviesViewController: BaseViewController<MoviesView>, UISearchBarDelegate {
    
    private let configuration: Configurable
    private let moviesViewModel: MoviesViewable
    private let genresViewModel: GenresViewable
    private let searchViewModel: SearchViewable
    private let viewDataManager: MoviesCollectionViewDataManager
    private var searchMode: (active: Bool, query: String) = (false, "")
    private lazy var searchBar = mainView.searchBar
    private lazy var collectionView = mainView.collectionView
    
    // MARK: - Initialization
    required init(configuration: Configurable,
                  moviesViewModel: MoviesViewable,
                  genresViewModel: GenresViewable,
                  searchViewModel: SearchViewable,
                  viewDataManager: MoviesCollectionViewDataManager) {
        self.configuration = configuration
        self.moviesViewModel = moviesViewModel
        self.genresViewModel = genresViewModel
        self.viewDataManager = viewDataManager
        self.searchViewModel = searchViewModel
        super.init()
    }
    
    convenience init(with configuration: Configurable) {
        self.init(configuration: configuration,
                  moviesViewModel: MoviesViewModel(),
                  genresViewModel: GenresViewModel(),
                  searchViewModel: SearchViewModel(),
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
        
        moviesViewModel.moviesUpcomingResponse.bind { [weak self] response in
            guard let self = self, let response = response,
                  let results = response.results else { return }
            if response.page > 1 {
                self.viewDataManager.updateMoviesModel(with: results)
            } else {
                self.viewDataManager.setMoviesModel(results)
            }
        }
        
        searchViewModel.searchMoviesResults.bind { [weak self] searchResults in
            guard let self = self, let searchResults = searchResults else { return }
            if searchResults.page > 1 {
                self.viewDataManager.updateMoviesModel(with: searchResults.results)
            } else {
                self.viewDataManager.setMoviesModel(searchResults.results)
            }
            
        }
    }
    
    private func setupView() {
        searchBar.delegate = self
        viewDataManager.delegate = self
        viewDataManager.setup(collectionView: collectionView)
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barStyle = .black
            navigationBar.isTranslucent = true
            navigationBar.tintColor = .white
        }
    }
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count >= 3 else {
            searchMode = (false, "")
            moviesViewModel.fetchMovies(page: 1)
            return
        }
        searchMode = (true, searchText)
        searchViewModel.searchMovies(with: searchText, page: 1)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
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
        searchBar.text = searchMode.query
        view.becomeFirstResponder()
        view.endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if (scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            let currentPage: Int = viewDataManager.totalItems / moviesViewModel.resultsPerPage
            if searchMode.active {
                searchViewModel.searchMovies(with: searchMode.query, page: currentPage + 1)
            } else {
                moviesViewModel.fetchMovies(page: currentPage + 1)
            }
        }
    }
}


