//
//  People.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct People: Codable {
    var birthday: String?
    var knownForDepartment: String
    var deathday: String?
    var id: Int
    var name: String
    var alsoKnownAs: [String]
    var gender: Int // minimum: 0, maximum: 2, default: 0
    var biography: String
    var popularity: Double
    var placeOfBirth: String?
    var profilePath: String?
    var adult: Bool
    var imdbId: String
    var homepage: String?
    
    enum CodingKeys: String, CodingKey {
        case birthday
        case knownForDepartment = "known_for_department"
        case deathday
        case id
        case name
        case alsoKnownAs = "also_known_as"
        case gender
        case biography
        case popularity
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
        case adult
        case imdbId = "imdb_id"
        case homepage
    }

}
