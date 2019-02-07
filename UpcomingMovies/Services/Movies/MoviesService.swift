//
//  MoviesService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol MoviesServiceHandler: ServiceHandler {
    func didReceiveData(_ data: MoviesUpcomingResponse)
}

struct MoviesService: Gettable {
    typealias DataType = MoviesUpcomingResponse
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable? = MoviesUpcomingParams()
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
}
