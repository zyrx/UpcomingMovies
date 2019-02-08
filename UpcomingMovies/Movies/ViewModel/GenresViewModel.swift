//
//  GenresViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol GenresViewable {
    var genres: Box<[Genre]> { get }
    func fetchGenres()
}

class GenresViewModel: GenresViewable {
    private var genresService: GenresService
    public var params: GenresParams
    public let genres: Box<[Genre]> = Box([])
    
    // MARK: - Initialization
    init(genresService: GenresService,
         params: GenresParams) {
        self.genresService = genresService
        self.params = params
    }
    
    convenience init() {
        self.init(genresService: GenresService(endpoint: GenresEndpoint.movieList),
                  params: GenresParams())
    }

    func fetchGenres() {
        getData(from: genresService)
    }
}

// MARK: - GenresServiceHandler
extension GenresViewModel: GenresServiceHandler {
    func didReceiveData(_ data: GenresResponse) {
        genres.value = data.genres
    }
}
