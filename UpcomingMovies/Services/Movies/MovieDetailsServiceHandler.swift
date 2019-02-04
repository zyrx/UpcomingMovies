//
//  MovieDetailsServiceHandler.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol MovieDetailsServiceHandler: ServiceHandler {
    func didReceiveData(_ data: Movie)
}
