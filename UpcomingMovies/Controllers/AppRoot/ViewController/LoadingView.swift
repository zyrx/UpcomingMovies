//
//  LoadingView.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 10/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    public lazy var activityIndicator = UIActivityIndicatorView(style: .white)
    private lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Loading..."
        return label
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
        backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX).offset(-(activityIndicator.bounds.height / 2))
            make.centerY.equalToSuperview()
        }
        
        addSubview(loadingLabel)
        loadingLabel.snp.makeConstraints { make in
            make.top.equalTo(activityIndicator.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}
