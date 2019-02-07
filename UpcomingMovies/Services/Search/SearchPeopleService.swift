//
//  SearchPeopleService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct SearchPeopleParams {
    var language: String?
    var query: String
    var page: Int?
    var includeAdult: Bool?
    var region: String?
}

struct SearchPeopleService: Gettable {
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    init() {
        self.init(endpoint: SearchEndpoint.people)
    }
    
    func get(_ completion: @escaping (Result<SearchPeople>) -> Void) {
        // TODO: Get Method implementation
    }
}
