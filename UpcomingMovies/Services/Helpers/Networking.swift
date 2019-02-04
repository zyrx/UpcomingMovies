//
//  Networking.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case emptyResponse
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol Gettable {
    associatedtype DataType
    var endpoint: Endpoint & BaseURL { get }
    func get(_ completion: @escaping (Result<DataType>) -> Void)
}

enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}
