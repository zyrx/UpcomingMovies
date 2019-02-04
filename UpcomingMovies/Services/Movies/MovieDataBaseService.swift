//
//  MovieDataBaseService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct MovieDataBaseService: Gettable {
    
    let endpoint: BaseURL & Endpoint
    var params: [String: Any]?
    
    // MARK: - Initialization
    init(endpoint: Endpoint & BaseURL) {
        self.endpoint = endpoint
    }
    
    init() {
        self.init(endpoint: MoviesEndpoint.details)
    }
    
    func get(_ completion: @escaping (Result<[String]>) -> Void) {
        guard let url = endpoint.serviceUrl else {
            fatalError()
        }
        
        var request = URLRequest(url: url)
        
        if let params = params  {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            let decoder = JSONDecoder()
            guard let data = data, let dataResponse = try? decoder.decode([String].self, from: data) else {
                completion(.failure(NetworkError.emptyResponse))
                return
            }
            completion(.success(dataResponse))
        }
        task.resume()
    }
}
