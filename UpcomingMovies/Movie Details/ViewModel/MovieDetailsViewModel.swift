//
//  MovieDetailsViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol MovieDetailsViewable {
    func fetchMovieDetails(for id: Int)
}

class MovieDetailsViewModel: MovieDetailsViewable {
    
    var movieDetailsService: MovieDetailsService
    let movie: Box<Movie?> = Box(nil)
    
    // MARK: - Initialization
    init(movieDetailsService: MovieDetailsService) {
        self.movieDetailsService = movieDetailsService
    }
    
    convenience init() {
        self.init(movieDetailsService: MovieDetailsService(endpoint: MoviesEndpoint.details))
    }
    
    func fetchMovieDetails(for id: Int) {
        movieDetailsService.params = MovieDetailsParams(movieId: id)
        getData(from: movieDetailsService)
    }
}

// MARK: - MoviesServiceHandler
extension MovieDetailsViewModel: MovieDetailsServiceHandler {
    func didReceiveData(_ data: Movie) {
        movie.value = data
    }
}
