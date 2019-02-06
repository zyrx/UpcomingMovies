//
//  URLRequest+QueryItems.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

extension URLRequest {
    init?(url: URL, queryItems: [String: Any]) {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        components.queryItems = queryItems.compactMap {
            URLQueryItem(name: "\($0.key)", value: "\($0.value)")
        }
        
        guard let url = components.url else { return nil }
        self.init(url: url)
    }
    
    init?(with endpoint: Endpoint & BaseURL, params: [String: Any]? = nil) {
        guard let url = endpoint.serviceUrl else { return nil }
        var params = params ?? [String: Any]()
        params["api_key"] = endpoint.apiKey
        if case .get = endpoint.method {
            self.init(url: url, queryItems: params)
        } else {
            self.init(url: url)
            httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        httpMethod = endpoint.method.name
    }
}
