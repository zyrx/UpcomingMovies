//
//  MoviesUpcomingParams.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct MoviesUpcomingParams: Encodable {
    var language: String?
    var page: Int = 1
    var region: String?
}
