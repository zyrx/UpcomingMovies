//
//  FindService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct FindParams {
    var language: String?
    var externalSource: String
}

struct FindService: Gettable {
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    init() {
        self.init(endpoint: FindEndpoint.find)
    }
    
    func get(_ completion: @escaping (Result<Find>) -> Void) {
        // TODO: Get Method implementation
    }
}
