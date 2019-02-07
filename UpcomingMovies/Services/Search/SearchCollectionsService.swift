//
//  SearchCollectionsService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct SearchCollectionsParams {
    var language: String?
    var query: String
    var page: Int?
}

struct SearchCollectionsService: Gettable {
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    init() {
        self.init(endpoint: SearchEndpoint.collections)
    }
    
    
    func get(_ completion: @escaping (Result<SearchCollections>) -> Void) {
        // TODO: Get Method implementation
    }
}
