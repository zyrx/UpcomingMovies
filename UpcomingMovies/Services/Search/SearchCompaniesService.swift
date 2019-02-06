//
//  SearchCompaniesService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct SearchCompaniesParams {
    var query: String
    var page: Int?
}

struct SearchCompaniesService: Gettable {
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    init() {
        self.init(endpoint: SearchEndpoint.companies)
    }
    
    func get(_ completion: @escaping (Result<SearchCompanies>) -> Void) {
        // TODO: Get Method implementation
    }
}
