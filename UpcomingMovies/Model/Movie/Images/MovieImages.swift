//
//  MovieImages.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol ImageDetail: Codable {
    var aspectRatio: Double { get set }
    var filePath: String { get set }
    var height: Int { get set }
    var iso6391: String? { get set }
    var voteAverage: Int { get set }
    var voteCount: Int { get set }
    var width: Int { get set }
}

struct MovieImages: Codable {
    var id: Int
    var backdrops: [Backdrop]
    var posters: [Poster]
}
