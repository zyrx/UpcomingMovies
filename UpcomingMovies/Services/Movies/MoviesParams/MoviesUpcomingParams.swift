//
//  MoviesUpcomingParams.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct MoviesUpcomingParams: Encodable {
    var language: String?
    var page: Int = 1
    var region: String?
}
