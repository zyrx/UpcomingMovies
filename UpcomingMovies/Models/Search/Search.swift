//
//  Search.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol Search: Codable {
    associatedtype SearchResultType
    
    var page: Int { get set }
    var results: [SearchResultType] { get set }
    var totalPages: Int { get set }
    var totalResults: Int { get set }
}
