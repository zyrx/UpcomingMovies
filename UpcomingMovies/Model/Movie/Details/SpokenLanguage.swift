//
//  SpokenLanguage.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct SpokenLanguage: Codable {
    var iso6391: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case name
    }
}
