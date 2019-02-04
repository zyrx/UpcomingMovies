//
//  Search.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol Search: Codable {
    associatedtype SearchResultType
    
    var page: Int { get set }
    var results: [SearchResultType] { get set }
    var totalPages: Int { get set }
    var totalResults: Int { get set }
}
