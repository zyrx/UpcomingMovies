//
//  GenresService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol GenresServiceHandler: ServiceHandler {
    func didReceiveData(_ data: GenresResponse)
}

struct GenresService: Gettable {
    typealias DataType = GenresResponse
    
    let endpoint: BaseURL & Endpoint
    var params: Encodable? = GenresParams()
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
}
