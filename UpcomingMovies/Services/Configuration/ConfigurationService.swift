//
//  ConfigurationService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct ConfigurationService: Gettable {
    
    let endpoint: BaseURL & Endpoint
    var params: [String: Any]?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    init() {
        self.init(endpoint: ConfigurationEndpoint.apiConfiguration)
    }
    
    func get(_ completion: @escaping (Result<Configuration>) -> Void) {
        // TODO: Get Method implementation
    }
}
