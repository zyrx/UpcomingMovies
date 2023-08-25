//
//  MovieDetailsTableViewDataManager.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 09/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit
import Kingfisher

public typealias MovieDetails = (title: String, description: String)

class MovieDetailsTableViewDataManager: NSObject {
    
    private var moviesSectionHeader: String?
    private weak var tableView: UITableView?
    private var movieDetailsModel: [MovieDetails] = []
    private var setMovieDetailsImageUrl: URL?

    // MARK: - Setup & Configuration
    public func setup(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(cell: MovieDetailsTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    public func setMovieDetailsModel(_ model: [MovieDetails], imageUrl: URL?) {
        movieDetailsModel = model
        setMovieDetailsImageUrl = imageUrl
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension MovieDetailsTableViewDataManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetailsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let details = movieDetailsModel[indexPath.row]
        
        guard indexPath.row != 0 else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.imageView?.kf.setImage(with: setMovieDetailsImageUrl, placeholder: UpcomingMoviesAsset.placeholderW92.image)
            cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = details.title
            cell.detailTextLabel?.numberOfLines = 8
            cell.detailTextLabel?.text = details.description
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(MovieDetailsTableViewCell.self, style: .value2, for: indexPath)
        cell.updateWith(title: details.title, description: details.description)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MovieDetailsTableViewDataManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 160 : 70
    }
}
