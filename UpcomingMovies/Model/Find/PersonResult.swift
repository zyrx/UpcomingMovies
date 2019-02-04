//
//  PersonResult.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct PersonResult: Codable {
    var profilePath: String?
    var adult: Bool
    var id: Int
    // TODO: define for one of 2 objects
    var knownFor: String?
    var name: String
    var popularity: Double
    
    enum CodingKeys: String, CodingKey {
        case profilePath = "profile_path"
        case adult
        case id
        case knownFor = "known_for"
        case name
        case popularity
    }
}
