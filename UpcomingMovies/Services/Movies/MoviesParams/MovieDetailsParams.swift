//
//  MovieDetailsParams.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct MovieDetailsParams: Encodable {
    var movieId: Int
    
    enum CodingKeys: String, CodingKey {
        case movieId = "movie_id"
    }
}
