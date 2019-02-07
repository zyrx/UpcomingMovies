//
//  MoviesService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
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
