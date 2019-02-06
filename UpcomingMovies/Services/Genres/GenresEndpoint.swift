//
//  GenresEndpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

enum GenresEndpoint: MovieDatabaseApiEndpoint {
    // Get the list of official genres for movies.
    // @link: https://developers.themoviedb.org/3/genres/get-movie-list
    case movieList
    // Get the list of official genres for TV shows.
    // @link: https://developers.themoviedb.org/3/genres/get-tv-list
    case tvList
    
    var path: String {
        switch self {
        case .movieList:    return "/genre/movie/list"
        case .tvList:       return "/genre/tv/list"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movieList,
             .tvList:
            return .get
        }
    }
}
