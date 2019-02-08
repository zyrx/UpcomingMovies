//
//  Images.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation
import CoreGraphics

struct Images: Codable {
    var baseUrl: String
    var secureBaseUrl: String
    var backdropSizes: [String]
    var logoSizes: [String]
    var posterSizes: [String]
    var profileSizes: [String]
    var stillSizes: [String]

    enum CodingKeys: String, CodingKey {
        case baseUrl = "base_url"
        case secureBaseUrl = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
}

extension Images {
    enum Size: String {
        case original
        case w45
        case w92
        case w154
        case w185
        case w300
        case w342
        case w500
        case w780
        
        var name: String {
            return rawValue
//            switch self {
//            case .original: return "original"
//            case .w45:      return "w45"
//            case .w92:      return "w92"
//            case .w154:     return "w154"
//            case .w185:     return "w185"
//            case .w300:     return "w300"
//            case .w342:     return "w342"
//            case .w500:     return "w500"
//            case .w780:     return "w780"
//            }
        }
        
        var size: CGSize {
            let aspectRatio: CGFloat = 3/2
            var size: CGFloat = 0
            switch self {
            case .original: size = 1000
            case .w45: size = 45
            case .w92: size = 92
            case .w154: size = 154
            case .w185: size = 185
            case .w300: size = 300
            case .w342: size = 342
            case .w500: size = 500
            case .w780: size = 780
            }
            return CGSize(width: size, height: size * aspectRatio)
        }
    }
}
