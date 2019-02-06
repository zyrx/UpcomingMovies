//
//  MoviesCollectionViewCell.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit
import SnapKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    public lazy var titleLabel = UILabel()
    public lazy var overviewLabel = UILabel()
    
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
    public func updateWith(model: Movie) {
        titleLabel.text = model.title
        overviewLabel.text = model.overview
    }
    
    private func setupView() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(overviewLabel)
        overviewLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
