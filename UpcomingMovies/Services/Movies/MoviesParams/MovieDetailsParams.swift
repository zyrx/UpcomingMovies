//
//  MovieDetailsParams.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct MovieDetailsParams: Encodable {
    var movieId: Int
    
    enum CodingKeys: String, CodingKey {
        case movieId = "movie_id"
    }
}
