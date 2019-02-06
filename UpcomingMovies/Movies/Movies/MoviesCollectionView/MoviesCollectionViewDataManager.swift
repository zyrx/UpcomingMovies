//
//  MoviesCollectionViewDataManager.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class MoviesCollectionViewDataManager: NSObject {
    private let sectionHeaderHeight: CGFloat = 50.0
    private var moviesModel: [Movie] = []
    private var genresModel: [Genre] = []
    private weak var collectionView: UICollectionView?
    private var moviesSectionHeader: String?
    public weak var delegate: MoviesSearchResultsDelegate?
    
    public func setup(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.register(withClass: MoviesCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    public func setMoviesModel(_ models: [Movie]) {
        moviesModel = models
        print(models)
        DispatchQueue.main.async { [weak self] in
            self?.collectionView?.reloadData()
        }
    }
    
    public func setGenresModel(_ models: [Genre]) {
        genresModel = models
        print(models)
        DispatchQueue.main.async { [weak self] in
            self?.collectionView?.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MoviesCollectionViewDataManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.identifier, for: indexPath) as? MoviesCollectionViewCell else { return UICollectionViewCell() }
        let model = moviesModel[indexPath.row]
        cell.updateWith(model: model)
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension MoviesCollectionViewDataManager: UICollectionViewDelegate {
    
}
