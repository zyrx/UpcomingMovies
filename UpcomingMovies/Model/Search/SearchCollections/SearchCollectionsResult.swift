//
//  SearchCollectionsResult.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
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
