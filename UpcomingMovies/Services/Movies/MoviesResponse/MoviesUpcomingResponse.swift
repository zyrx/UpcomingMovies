//
//  MoviesUpcomingResponse.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct MoviesUpcomingResponse: Codable {
    var page: Int
    var results: [Movie]?
    var dates: Dates
    var totalPages: Int
    var totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Dates: Codable {
    var maximum: String
    var minimum: String
}
