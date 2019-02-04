//
//  Find.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct Find: Codable {
    var movieResults: [MovieResult]?
    var personResults: [PersonResult]?
    var tvResults: [TVResult]?
    // TODO: Implement TVEpisodeResult Model
    var tvEpisodeResults: [String]?
    // TODO: Implement TVSeasonResult Model
    var tvSeasonResults: [String]?
    
    enum CodingKeys: String, CodingKey {
        case movieResults = "movie_results"
        case personResults = "person_results"
        case tvResults = "tv_results"
        case tvEpisodeResults = "tv_episode_results"
        case tvSeasonResults = "tv_season_results"
    }
}
