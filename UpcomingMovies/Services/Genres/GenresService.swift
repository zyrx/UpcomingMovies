//
//  GenresService.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
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
