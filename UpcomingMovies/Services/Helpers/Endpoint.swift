//
//  Endpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
}

protocol BaseURL {
    var apiKey: String { get }
    var baseUrl: String { get }
    //var serviceUrl: URL? { get }
    func serviceUrl(with params: Encodable?) -> URL?
}

protocol MovieDatabaseApiEndpoint: Endpoint, BaseURL { }

extension MovieDatabaseApiEndpoint {
    var baseUrl: String {
        return "https://api.themoviedb.org/3"
    }
    
    var apiKey: String {
        return "1f54bd990f1cdfb230adb312546d765d"
    }
    
    func serviceUrl(with params: Encodable?) -> URL? {
        guard let params = params?.dictionary else {
            return URL(string: baseUrl + path)
        }
        var pathString = path
        for (key, value) in params {
            pathString = pathString.replacingOccurrences(of: "{\(key)}", with: "\(value)")
        }
        return URL(string: baseUrl + pathString)
    }
}
