//
//  Gettable.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol Gettable {
    associatedtype DataType
    var endpoint: Endpoint & BaseURL { get }
    var params: Encodable? { get set }
    func get(_ completion: @escaping (Result<DataType>) -> Void)
}

extension Gettable where Self.DataType: Decodable {
    func get(_ completion: @escaping (Result<DataType>) -> Void) {
        guard let request = URLRequest(with: endpoint, params: params?.dictionary) else {
            fatalError()
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return completion(.failure(NetworkError.emptyResponse))
            }
            
            do {
                let decoder = JSONDecoder()
                let dataResponse = try decoder.decode(DataType.self, from: data)
                completion(.success(dataResponse))
            } catch {
                completion(.failure(NetworkError.invalidData(error.localizedDescription)))
            }
        }
        task.resume()
    }
}
