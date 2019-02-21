//
//  MoviesView.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit
import SnapKit

class MoviesView: UIView {
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search..."
        if let textField = searchBar.value(forKey: "_searchField") as? UITextField {
            textField.clearButtonMode = .never
        }
        return searchBar
    }()
    
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
        
        // Collection View
        let contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.contentInset = contentInset
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            if #available(iOS 11, *) {
                make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
            } else {
                make.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
}
