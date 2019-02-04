//
//  MovieDetailsViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol MovieDetailsViewable {
    func fetchMovieDetails(for id: Int)
}

class MovieDetailsViewModel: MovieDetailsViewable {
    
    let movieDetailsService: MovieDetailsService
    let movie: Box<Movie?> = Box(nil)
    
    // MARK: - Initialization
    init(service: MovieDetailsService) {
        movieDetailsService = service
    }
    
    convenience init() {
        self.init(service: MovieDetailsService())
    }
    
    func fetchMovieDetails(for id: Int) {
        movieDetailsService.getMovieDetails(id: id)
    }
}

// MARK: - MoviesServiceHandler
extension MovieDetailsViewModel: MovieDetailsServiceHandler {
    func didReceiveData(_ data: Movie) {
        movie.value = data
    }
}
