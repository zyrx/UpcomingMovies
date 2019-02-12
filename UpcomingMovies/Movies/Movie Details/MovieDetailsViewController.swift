//
//  MovieDetailsViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class MovieDetailsViewController: BaseViewController<MovieDetailsView> {
    
    let viewModel: MovieDetailsViewable
    
    // MARK: - Initialization
    required init(viewModel: MovieDetailsViewable) {
        self.viewModel = viewModel
        super.init()
    }
    
    convenience override init() {
        self.init(viewModel: MovieDetailsViewModel())
    }

    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
