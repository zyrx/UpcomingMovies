//
//  MovieDetailsService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
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
