//
//  MoviesCollectionViewDataManager.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class MoviesCollectionViewDataManager: NSObject {
    private let configuration: Configurable
    private let imagesSize: Images.Size = .w92
    
    private var moviesModel: [Movie] = []
    private var genresModel: [Genre] = []
    
    private var moviesSectionHeader: String?
    private weak var collectionView: UICollectionView?
    
    public weak var delegate: MoviesSearchResultsDelegate?
    
    // MARK: - Initialization
    required init(with configuration: Configurable) {
        self.configuration = configuration
        super.init()
    }
    
    // MARK: - Setup & Configuration
    public func setup(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.register(withClass: MoviesCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    public func setMoviesModel(_ models: [Movie]) {
        moviesModel = models
        //print(models)
        DispatchQueue.main.async { [weak self] in
            self?.collectionView?.reloadData()
        }
    }
    
    public func setGenresModel(_ models: [Genre]) {
        genresModel = models
        //print(models)
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
        cell.updateWith(model: model, image: (size: imagesSize, url: configuration.images.secureBaseUrl))
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MoviesCollectionViewDataManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = imagesSize.size
        size.height = size.height + 44
        return size
    }
}
