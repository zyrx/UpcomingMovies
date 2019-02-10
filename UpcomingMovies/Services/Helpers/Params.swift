//
//  Params.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 09/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

struct Params {
    var header: Encodable? = nil
    var path: Encodable? = nil
    var query: Encodable? = nil
    var body: Encodable? = nil
    
    init() {
        header = nil
        path = nil
        query = nil
        body = nil
    }
    
    init(header: Encodable) {
        self.header = header
    }
    
    init(path: Encodable) {
        self.path = path
    }
    
    init(query: Encodable) {
        self.query = query
    }
    
    init(body: Encodable) {
        self.body = body
    }
}
