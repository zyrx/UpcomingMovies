//
//  MoviesCollectionViewDataManager.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

protocol MoviesCollectionViewDelegate: MoviesSearchResultsDelegate {
    func moviesCollectionView(didSelectItemAt indexPath: IndexPath)
}

class MoviesCollectionViewDataManager: NSObject {
    private let configuration: Configurable
    private let imagesSize: Images.Size = .w92
    
    private var moviesModel: [Movie] = []
    private var genresModel: [Genre] = []
    
    private var moviesSectionHeader: String?
    private weak var collectionView: UICollectionView?
    
    public var totalItems: Int { return moviesModel.count }
    public weak var delegate: MoviesCollectionViewDelegate?
    
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
        DispatchQueue.main.async { [weak self] in
            self?.collectionView?.reloadData()
        }
    }
    
    public func updateMoviesModel(with models: [Movie]) {
        moviesModel.append(contentsOf: models)
        DispatchQueue.main.async { [weak self] in
            self?.collectionView?.reloadData()
        }
    }
    
    public func setGenresModel(_ models: [Genre]) {
        genresModel = models
        DispatchQueue.main.async { [weak self] in
            self?.collectionView?.reloadData()
        }
    }
    
    public func getModel(for indexPath: IndexPath) -> Movie? {
        guard moviesModel.indices.contains(indexPath.row) else { return nil }
        return moviesModel[indexPath.row]
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.moviesCollectionView(didSelectItemAt: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll(scrollView)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegate?.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
}
