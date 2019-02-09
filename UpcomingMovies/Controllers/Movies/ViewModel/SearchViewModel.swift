//
//  SearchViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 10/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol SearchViewable {
    var searchMoviesResults: Box<SearchMovies?> { get }
    func searchMovies(with query: String, page: Int)
}

class SearchViewModel: SearchViewable {
    private var searchMoviesService: SearchMoviesService
    public var resultsPerPage: Int = 20
    public var params: SearchMoviesParams
    public let searchMoviesResults: Box<SearchMovies?> = Box(nil)
    
    // MARK: - Initialization
    init(searchMoviesService: SearchMoviesService,
         params: SearchMoviesParams) {
        self.searchMoviesService = searchMoviesService
        self.params = params
    }
    
    convenience init() {
        self.init(searchMoviesService: SearchMoviesService(endpoint: SearchEndpoint.movies),
                  params: SearchMoviesParams())
    }
    
    func searchMovies(with query: String, page: Int) {
        params.page = page > 0 ? page : 1
        params.query = query
        searchMoviesService.params.query = params
        getData(from: searchMoviesService)
    }
}

extension SearchViewModel: SearchMoviesServiceHandler {
    func didReceiveData(_ data: SearchMoviesResponse) {
        searchMoviesResults.value = data
    }
}
