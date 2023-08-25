//
//  MoviesTableViewDataManager.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

public protocol MoviesSearchResultsDelegate: NSObjectProtocol {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>)
}

class MoviesTableViewDataManager: NSObject {
    
    private let sectionHeaderHeight: CGFloat = 50.0
    private var moviesModel: [Movie] = []
    private var genresModel: [Genre] = []
    private weak var tableView: UITableView?
    private var moviesSectionHeader: String?
    public weak var delegate: MoviesSearchResultsDelegate?
    
    public func setup(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(cell: MoviesTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    public func setMoviesModel(_ models: [Movie]) {
        moviesModel = models
        print(models)
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
    
    public func setGenresModel(_ models: [Genre]) {
        genresModel = models
        print(models)
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
    
    public func getModel(for indexPath: IndexPath) -> Movie? {
        guard moviesModel.indices.contains(indexPath.row) else { return nil }
        return moviesModel[indexPath.row]
    }
}

// MARK: - UITableViewDataSource
extension MoviesTableViewDataManager: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesModel.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else { return UITableViewCell() }
        let model = moviesModel[indexPath.row]
        cell.updateWith(model: model)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return moviesSectionHeader
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return moviesSectionHeader != nil ? sectionHeaderHeight : 0.0
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
}

// MARK: - UITableViewDelegate
extension MoviesTableViewDataManager: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do something when selected
    }
}

// MARK: - MoviesSearchResultsDelegate
extension MoviesTableViewDataManager {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll(scrollView)
    }
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegate?.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
}
