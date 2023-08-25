//
//  SearchEndpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

enum SearchEndpoint: MovieDatabaseApiEndpoint {
    // Search for companies.
    // @link: https://developers.themoviedb.org/3/search/search-companies
    case companies
    // Search for collections.
    // @link: https://developers.themoviedb.org/3/search/search-collections
    case collections
    // Search for keywords.
    // @link: https://developers.themoviedb.org/3/search/search-keywords
    case keywords
    // Search for movies.
    // @link: https://developers.themoviedb.org/3/search/search-movies
    case movies
    // Search multiple models in a single request.
    // @link: https://developers.themoviedb.org/3/search/multi-search
    case multiSearch
    // Search for people.
    // @link: https://developers.themoviedb.org/3/search/search-people
    case people
    // Search for a TV show.
    // @link: https://developers.themoviedb.org/3/search/search-tv-shows
    case tvShows
    
    var path: String {
        switch self {
        case .companies:    return "/search/company"
        case .collections:  return "/search/collection"
        case .keywords:     return "/search/keyword"
        case .movies:       return "/search/movie"
        case .multiSearch:  return "/search/multi"
        case .people:       return "/search/person"
        case .tvShows:      return "/search/tv"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .companies,
             .collections,
             .keywords,
             .movies,
             .multiSearch,
             .people,
             .tvShows:
            return .get
        }
    }
}
