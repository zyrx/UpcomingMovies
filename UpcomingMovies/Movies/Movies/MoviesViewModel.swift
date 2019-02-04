//
//  MoviesViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol MoviesViewable {
    var movies: Box<[Movie]> { get }
    func fetchMovies(page: Int)
}

class MoviesViewModel: MoviesViewable {
    
    private let moviesService: MoviesService
    public var movies: Box<[Movie]> = Box([])
    
    // MARK: - Initialization
    init(moviesService: MoviesService) {
        self.moviesService = moviesService
    }
    
    convenience init() {
        self.init(moviesService: MoviesService())
    }
    
    func fetchMovies(page: Int) {
        getData(from: moviesService)
    }
}

// MARK: - MoviesServiceHandler
extension MoviesViewModel: MoviesServiceHandler {
    func didReceiveData(_ data: [Movie]) {
        movies.value = data
    }
}
