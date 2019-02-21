//
//  TVResult.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct TVResult: Codable {
    var posterPath: String?
    var popularity: Double
    var id: Int
    var backdropPath: String?
    var voteAverage: Double
    var overview: String
    var firstAirDate: String
    var originCountry: [String]
    var genreIds: [Int]
    var originalLanguage: String
    var voteCount: Int
    var name: String
    var originalName: String
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case popularity
        case id
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case overview
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
    }
}
