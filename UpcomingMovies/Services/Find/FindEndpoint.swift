//
//  FindEndpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

enum FindEndpoint: MovieDatabaseApiEndpoint {
    // The find method makes it easy to search for objects by an external id.
    // @link: https://developers.themoviedb.org/3/find/find-by-id
    case find
    
    var path: String {
        switch self {
        case .find:    return "/find/{external_id}"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .find:
            return .get
        }
    }
}
