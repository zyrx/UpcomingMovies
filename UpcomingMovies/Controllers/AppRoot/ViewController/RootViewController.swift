//
//  RootViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 08/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit
import SnapKit

class RootViewController: BaseViewController<RootView> {
    
    let viewModel: ConfigurationViewable
    
    // MARK: - Initialization
    required init(viewModel: ConfigurationViewable) {
        self.viewModel = viewModel
        super.init()
    }
    
    convenience override init() {
        self.init(viewModel: ConfigurationViewModel())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        viewModel.getConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.activityIndicator.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mainView.activityIndicator.stopAnimating()
    }
    
    private func setupView() {
        
    }
    
    private func bindViewModel() {
        viewModel.configuration.bind { configuration in
            guard let configuration = configuration else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                let moviesViewController = MoviesViewController(with: configuration)
                let moviesNavigationController = UINavigationController(rootViewController: moviesViewController)
                moviesNavigationController.modalTransitionStyle = .crossDissolve
                self?.present(moviesNavigationController, animated: true, completion: nil)
            }
        }
    }
}
