//
//  Configuration.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol Configurable {
    var images: Images { get }
    var changeKeys: [String] { get }
}

struct Configuration: Configurable, Codable {
    var images: Images
    var changeKeys: [String]
    
    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys = "change_keys"
    }
}

extension Configuration {
    public static func get(from dictionary: [String: Any]) -> Configuration? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else {
                return nil
        }
        return try? JSONDecoder().decode(Configuration.self, from: data)
    }
}

