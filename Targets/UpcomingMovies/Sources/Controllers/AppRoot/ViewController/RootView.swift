//
//  RootView.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 08/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

class RootView: UIView {
    private lazy var loadingView: LoadingView = LoadingView()
    public lazy var activityIndicator: UIActivityIndicatorView = loadingView.activityIndicator
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UpcomingMoviesAsset.background.image
        return imageView
    }()
    
    private lazy var logoImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UpcomingMoviesAsset.logo.image
        return imageView
    }()
    
    // MARK: - Initialization
    public convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func setupView() {
        addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(logoImageview)
        logoImageview.snp.makeConstraints { make in
            make.width.height.equalTo(128)
            make.center.equalToSuperview()
        }
        
        addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
