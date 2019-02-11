//
//  SearchMoviesParams.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 10/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct SearchMoviesParams: Encodable {
    var language: String?
    var query: String
    var page: Int?
    var includeAdult: Bool?
    var region: String?
    var year: Int?
    var primaryReleaseYear: Int?
    
    init() {
        language = nil
        query = ""
        page = nil
        includeAdult = nil
        region = nil
        year = nil
        primaryReleaseYear = nil
    }
}
