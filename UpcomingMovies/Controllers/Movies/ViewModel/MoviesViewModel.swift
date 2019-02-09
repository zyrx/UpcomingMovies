//
//  MoviesViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol MoviesViewable {
    var resultsPerPage: Int { get }
    var moviesUpcomingResponse: Box<MoviesUpcomingResponse?> { get }
    func fetchMovies(page: Int)
}

class MoviesViewModel: MoviesViewable {
    private var moviesService: MoviesService
    public var resultsPerPage: Int = 20
    public var params: MoviesUpcomingParams
    public let moviesUpcomingResponse: Box<MoviesUpcomingResponse?> = Box(nil)
    
    // MARK: - Initialization
    init(moviesService: MoviesService,
         params: MoviesUpcomingParams) {
        self.moviesService = moviesService
        self.params = params
    }
    
    convenience init() {
        self.init(moviesService: MoviesService(endpoint: MoviesEndpoint.upcoming),
                  params: MoviesUpcomingParams())
    }
    
    func fetchMovies(page: Int) {
        params.page = page > 0 ? page : 1
        moviesService.params.query = params
        getData(from: moviesService)
    }
}

// MARK: - MoviesServiceHandler
extension MoviesViewModel: MoviesServiceHandler {
    func didReceiveData(_ data: MoviesUpcomingResponse) {
        moviesUpcomingResponse.value = data
    }
}
