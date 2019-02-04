//
//  Review.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct Review: Codable {
    var id: String
    var author: String
    var content: String
    var iso6391: String
    var mediaId: Int
    var mediaTitle: String
    var mediaType: String
    var url: String

    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content
        case iso6391 = "iso_639_1"
        case mediaId = "media_id"
        case mediaTitle = "media_title"
        case mediaType = "media_type"
        case url
    }
}
