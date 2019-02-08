//
//  UITableView+Extensions.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

// MARK: UITableViewCell
public extension UITableView {
    @discardableResult
    final public func register<T: UITableViewCell>(withClass cellClass: T.Type) -> UITableView {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
        return self
    }
}
