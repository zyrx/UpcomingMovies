//
//  URLRequest+QueryItems.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
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
    
    init?(with endpoint: Endpoint & BaseURL, params:Params) {
        guard let url = endpoint.serviceUrl(with: params.path) else {
            return nil
        }
        var query = params.query?.dictionary ?? [String: Any]()
        query["api_key"] = endpoint.apiKey
        self.init(url: url, queryItems: query)
        
        if let header = params.header?.dictionary as? [String: String] {
            self.allHTTPHeaderFields = header
        }
        
        if let body = params.body?.dictionary {
            httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        }
        
        httpMethod = endpoint.method.name
    }
}
