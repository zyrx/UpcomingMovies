//
//  Collection.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 10/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct Collection: Codable {
    var id: Int
    var name: String
    var posterPath: String
    var backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
