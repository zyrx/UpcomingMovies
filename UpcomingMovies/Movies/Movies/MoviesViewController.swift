//
//  MoviesViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class MoviesViewController: BaseViewController<MoviesView> {
    
    private let viewModel: MoviesViewable
    
    // MARK: - Initialization
    required init(viewModel: MoviesViewable) {
        self.viewModel = viewModel
        super.init()
    }
    
    override convenience init() {
        self.init(viewModel: MoviesViewModel())
    }
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
