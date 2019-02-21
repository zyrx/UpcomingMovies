//
//  MultiSearchService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct MultiSearchParams {
    var language: String?
    var query: String
    var page: Int?
    var includeAdult: Bool?
    var region: String?
}

struct MultiSearchService: Gettable {
    typealias DataType = MultiSearchResult
    
    let endpoint: BaseURL & Endpoint
    var params: Params = Params()
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
}
