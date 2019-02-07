//
//  MoviesView.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit
import SnapKit

class MoviesView: UIView {
    
    public lazy var searchBar = UISearchBar()
    //public lazy var tableView = MoviesTableView()
    public lazy var collectionView = MoviesCollectionView()

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
        backgroundColor = .white
        
        // Search Bar View
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(snp_topMargin)
            make.leading.trailing.equalToSuperview()
        }
        
        // Table View
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
//        // Table View
//        addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//            make.top.equalTo(searchBar.snp.bottom)
//            make.leading.trailing.bottom.equalToSuperview()
//        }
    }
}
