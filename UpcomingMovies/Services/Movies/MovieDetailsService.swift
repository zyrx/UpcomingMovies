//
//  MovieDetailsService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct MovieDetailsService: Gettable {    
    typealias DataType = MovieDetailsResponse
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable? = MovieDetailsParams(movieId: 0)
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    func getMovieDetails(id: Int) {
        let path = String(format: "/movie/%@", id) // {movie_id}
        print(path)
    }
}
