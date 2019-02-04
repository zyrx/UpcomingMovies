//
//  SearchCollectionsResult.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct SearchCollectionsResult: Codable {
    var id: Int
    var backdropPath: String?
    var name: String
    var posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case name
        case posterPath = "poster_path"
    }
}
