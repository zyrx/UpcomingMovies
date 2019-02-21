//
//  MoviesEndpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

enum MoviesEndpoint: MovieDatabaseApiEndpoint {
    // Get the primary information about a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-details
    case details
    // Grab the following account states for a session: Movie rating; watchlist; favourite list
    // @link: https://developers.themoviedb.org/3/movies/get-movie-account-states
    case accountStates
    // Get all of the alternative titles for a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-alternative-titles
    case alternativeTitles
    // Get the changes for a movie. By default only the last 24 hours are returned.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-changes
    case changes
    // Get the cast and crew for a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-credits
    case credits
    // Get the external ids for a movie. We currently support the following external sources.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-external-ids
    case externalIDs
    // Get the images that belong to a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-images
    case images
    // Get the keywords that have been added to a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-keywords
    case keywords
    // Get the release date along with the certification for a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-release-dates
    case releaseDates
    // Get the videos that have been added to a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-videos
    case videos
    // Get a list of translations that have been created for a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-translations
    case translations
    // Get a list of recommended movies for a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-recommendations
    case recommendations
    // Get a list of similar movies. This is not the same as the "Recommendation" system you see on the website.
    // @link: https://developers.themoviedb.org/3/movies/get-similar-movies
    case similarMovies
    // Get the user reviews for a movie.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-reviews
    case reviews
    // Get a list of lists that this movie belongs to.
    // @link: https://developers.themoviedb.org/3/movies/get-movie-lists
    case lists
    // Rate a movie.
    // @link: https://developers.themoviedb.org/3/movies/rate-movie
    case rateMovie
    // Remove your rating for a movie.
    // @link: https://developers.themoviedb.org/3/movies/delete-movie-rating
    case deleteRating
    // Get the most newly created movie. This is a live response and will continuously change.
    // @link: https://developers.themoviedb.org/3/movies/get-latest-movie
    case latest
    // Get a list of movies in theatres.
    // @link: https://developers.themoviedb.org/3/movies/get-now-playing
    case nowPlaying
    // Get a list of the current popular movies on TMDb. This list updates daily.
    // @link: https://developers.themoviedb.org/3/movies/get-popular-movies
    case popular
    // Get the top rated movies on TMDb.
    // @link: https://developers.themoviedb.org/3/movies/get-top-rated-movies
    case topRated
    // Get a list of upcoming movies in theatres.
    // @link: https://developers.themoviedb.org/3/movies/get-upcoming
    case upcoming
    
    var path: String {
        switch self {
        case .details:              return "/movie/{movie_id}"
        case .accountStates:        return "/movie/{movie_id}/account_states"
        case .alternativeTitles:    return "/movie/{movie_id}/alternative_titles"
        case .changes:              return "/movie/{movie_id}/changes"
        case .credits:              return "/movie/{movie_id}/credits"
        case .externalIDs:          return "/movie/{movie_id}/external_ids"
        case .images:               return "/movie/{movie_id}/images"
        case .keywords:             return "/movie/{movie_id}/keywords"
        case .releaseDates:         return "/movie/{movie_id}/release_dates"
        case .videos:               return "/movie/{movie_id}/videos"
        case .translations:         return "/movie/{movie_id}/translations"
        case .recommendations:      return "/movie/{movie_id}/recommendations"
        case .similarMovies:        return "/movie/{movie_id}/similar"
        case .reviews:              return "/movie/{movie_id}/reviews"
        case .lists:                return "/movie/{movie_id}/lists"
        case .rateMovie:            return "/movie/{movie_id}/rating"
        case .deleteRating:         return "/movie/{movie_id}/rating"
        case .latest:               return "/movie/latest"
        case .nowPlaying:           return "/movie/now_playing"
        case .popular:              return "/movie/popular"
        case .topRated:             return "/movie/top_rated"
        case .upcoming:             return "/movie/upcoming"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .details,
             .accountStates,
             .alternativeTitles,
             .changes,
             .credits,
             .externalIDs,
             .images,
             .keywords,
             .releaseDates,
             .videos,
             .translations,
             .recommendations,
             .similarMovies,
             .reviews,
             .lists:
            return .get
            
        case .rateMovie:
            return .post
            
        case .deleteRating:
            return .delete
            
        case .latest,
             .nowPlaying,
             .popular,
             .topRated,
             .upcoming:
            return .get
        }
    }
}
