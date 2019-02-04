//
//  MultiSearchService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
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
    
    let endpoint: BaseURL & Endpoint
    var params: [String: Any]?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    init() {
        self.init(endpoint: SearchEndpoint.multiSearch)
    }
    
    
    func get(_ completion: @escaping (Result<MultiSearch>) -> Void) {
        // TODO: Get Method implementation
    }
}
