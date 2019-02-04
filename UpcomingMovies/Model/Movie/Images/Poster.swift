//
//  Poster.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct Poster: ImageDetail {
    var aspectRatio: Double
    var filePath: String
    var height: Int
    var iso6391: String?
    var voteAverage: Int
    var voteCount: Int
    var width: Int
    
    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
        case height
        case iso6391 = "iso_639_1"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }}
