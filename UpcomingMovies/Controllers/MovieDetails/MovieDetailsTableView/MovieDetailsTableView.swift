//
//  MovieDetailsTableView.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 09/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

class MovieDetailsTableView: UITableView {
    
    // MARK: - Initialization
    public convenience init() {
        self.init(frame: .zero, style: .plain)
        setupView()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
    }
}
