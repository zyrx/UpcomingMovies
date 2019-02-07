//
//  MoviesViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol MoviesViewable {
    var resultsPerPage: Int { get }
    var movies: Box<[Movie]> { get }
    func fetchMovies(page: Int)
}

class MoviesViewModel: MoviesViewable {
    private var moviesService: MoviesService
    public var resultsPerPage: Int = 20
    public var params: MoviesUpcomingParams
    public let movies: Box<[Movie]> = Box([])
    
    // MARK: - Initialization
    init(moviesService: MoviesService,
         params: MoviesUpcomingParams) {
        self.moviesService = moviesService
        self.params = params
    }
    
    convenience init() {
        self.init(moviesService: MoviesService(endpoint: MoviesEndpoint.upcoming),
                  params: MoviesUpcomingParams())
    }
    
    func fetchMovies(page: Int) {
        params.page = page > 0 ? page : 1
        moviesService.params = params
        getData(from: moviesService)
    }
}

// MARK: - MoviesServiceHandler
extension MoviesViewModel: MoviesServiceHandler {
    func didReceiveData(_ data: MoviesUpcomingResponse) {
        guard let results = data.results else {
            return movies.value = []
        }
        movies.value = results
    }
}
