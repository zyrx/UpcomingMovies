//
//  Endpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
}

protocol BaseURL {
    var baseUrl: String { get }
    var serviceUrl: URL? { get }
    var apiKey: String { get }
}

protocol MovieDatabaseApiEndpoint: Endpoint, BaseURL { }

extension MovieDatabaseApiEndpoint {
    var baseUrl: String {
        return "https://api.themoviedb.org"
    }
    
    var apiKey: String {
        return "1f54bd990f1cdfb230adb312546d765d"
    }
    
    var serviceUrl: URL? {
        return URL(string: baseUrl + path)
    }
}
