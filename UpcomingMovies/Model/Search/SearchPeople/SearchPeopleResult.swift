//
//  SearchPeopleResult.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct SearchPeopleResult: Codable {
    var profile_path: String?
    var adult: Bool
    var id: Int
    var knownFor: String? // One of 2 objects
    var name: String
    var popularity: Double
    
    enum CondingKeys: String, CodingKey {
        case profilePath = "profile_path"
        case adult
        case id
        case knownFor = "known_for"
        case name
        case popularity
    }
}
