//
//  Image.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct Image: Codable {
    var baseUrl: String?
    var secureBaseUrl: String?
    var backdropSizes: [String]?
    var logoSizes: [String]?
    var posterSizes: [String]?
    var profileSizes: [String]?
    var stillSizes: [String]?

    enum CodingKeys: String, CodingKey {
        case baseUrl = "base_url"
        case secureBaseUrl = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
}
