//
//  ConfigurationEndpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

enum ConfigurationEndpoint: MovieDatabaseApiEndpoint {
    // Get the system wide configuration information.
    // @link: https://developers.themoviedb.org/3/configuration/get-api-configuration
    case apiConfiguration
    // Get the list of countries (ISO 3166-1 tags) used throughout TMDb.
    // @link: https://developers.themoviedb.org/3/configuration/get-countries
    case countries
    // Get a list of the jobs and departments we use on TMDb.
    // @link: https://developers.themoviedb.org/3/configuration/get-jobs
    case jobs
    // Get the list of languages (ISO 639-1 tags) used throughout TMDb.
    // @link: https://developers.themoviedb.org/3/configuration/get-languages
    case languages
    // Get a list of the officially supported translations on TMDb.
    // @link: https://developers.themoviedb.org/3/configuration/get-primary-translations
    case primaryTranslations
    // Get the list of timezones used throughout TMDb.
    // @link: https://developers.themoviedb.org/3/configuration/get-timezones
    case timezones
    
    var path: String {
        switch self {
        case .apiConfiguration:     return "/configuration"
        case .countries:            return "/configuration/countries"
        case .jobs:                 return "/configuration/jobs"
        case .languages:            return "/configuration/languages"
        case .primaryTranslations:  return "/configuration/primary_translations"
        case .timezones:            return "/configuration/timezones"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .apiConfiguration,
             .countries,
             .jobs,
             .languages,
             .primaryTranslations,
             .timezones:
            return .get
        }
    }
}
