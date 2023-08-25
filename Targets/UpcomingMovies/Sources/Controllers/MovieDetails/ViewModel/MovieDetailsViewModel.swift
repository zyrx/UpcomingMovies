//
//  MovieDetailsViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol MovieDetailsViewable {
    var movie: Box<Movie?> { get }
    func fetchMovieDetails(for id: Int)
    func getMovieDetails(with movie: Movie) -> [MovieDetails]
}

class MovieDetailsViewModel: MovieDetailsViewable {
    
    var movieDetailsService: MovieDetailsService
    let movie: Box<Movie?> = Box(nil)
    
    // MARK: - Initialization
    init(movieDetailsService: MovieDetailsService) {
        self.movieDetailsService = movieDetailsService
    }
    
    convenience init() {
        self.init(movieDetailsService: MovieDetailsService(endpoint: MoviesEndpoint.details))
    }
    
    func fetchMovieDetails(for id: Int) {
        movieDetailsService.params.path = MovieDetailsParams(movieId: id)
        getData(from: movieDetailsService)
    }
    
    func getMovieDetails(with movie: Movie) -> [MovieDetails] {
        var details: [MovieDetails] = []
        var title = movie.title
        if let year = movie.releaseDate.split(separator: "-").first {
            title = "\(title) (\(year))"
        }
        details.append((title, movie.overview ?? ""))
        if let collection = movie.belongsToCollection {
            details.append(("Belongs to Collection", collection.name))
        }
        if let genres = movie.genres {
            let genresSring = genres.reduce(" | "){ $0 + $1.name + " | " }
            details.append(("Genres", genresSring))
        }
        details.append(("Original Title", movie.originalTitle))
        details.append(("Original Language", movie.originalLanguage.uppercased()))
        if let homepage = movie.homepage {
            details.append(("Web Page", homepage))
        }
        details.append((title: "Popularity", description: "\(movie.popularity)"))
        if let productionCompanies = movie.productionCompanies {
            let productionCompaniesString = productionCompanies.reduce(" | ") { $0 + $1.name + " | " }
            details.append(("Production Companies", productionCompaniesString))
        }
        if let productionCountries = movie.productionCountries {
            let productionCountriesString = productionCountries.reduce(" | ") { $0 + $1.name + " | " }
            details.append(("Production Countries", productionCountriesString))
        }
        details.append((title: "Release Date", description: movie.releaseDate))
        if let spokenLanguages = movie.spokenLanguages {
            let spokenLanguagesString = spokenLanguages.reduce(" | ") { $0 + $1.name + " | " }
            details.append(("Spoken Languages", spokenLanguagesString))
        }
        if let status = movie.status {
            details.append(("Status", status))
        }
        if let tagline = movie.tagline {
            details.append(("Tagline", tagline))
        }
        details.append(("Vote Average", "\(movie.voteAverage)"))
        details.append(("Vote Count", "\(movie.voteCount)"))
        if let imdbId = movie.imdbId {
            details.append(("IMDb", imdbId))
        }
        return details
    }
}

// MARK: - MoviesServiceHandler
extension MovieDetailsViewModel: MovieDetailsServiceHandler {
    func didReceiveData(_ data: Movie) {
        movie.value = data
    }
}
