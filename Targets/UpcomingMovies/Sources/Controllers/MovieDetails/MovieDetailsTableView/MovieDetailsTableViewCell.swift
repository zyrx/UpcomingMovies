//
//  MovieDetailsTableViewCell.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 09/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Initialization
    public convenience init() {
        self.init(style: .value2, reuseIdentifier: MovieDetailsTableViewCell.identifier)
        setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup & Configuration
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func updateWith(title: String, description: String) {
        self.textLabel?.text = title
        self.detailTextLabel?.text = description
    }
    
    private func setupView() {
        selectionStyle = .none
        textLabel?.numberOfLines = 0
        detailTextLabel?.numberOfLines = 3
    }
}
