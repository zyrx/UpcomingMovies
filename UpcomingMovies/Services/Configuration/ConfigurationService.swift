//
//  ConfigurationService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol ConfigurationServiceHandler: ServiceHandler {
    func didReceiveData(_ data: ConfigurationResponse)
}

struct ConfigurationService: Gettable {
    typealias DataType = ConfigurationResponse
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
}
