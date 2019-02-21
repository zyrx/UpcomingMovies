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
    final public func register<T: UITableViewCell>(cell: T.Type) -> UITableView {
        register(cell, forCellReuseIdentifier: cell.identifier)
        return self
    }
    
    final public func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type = T.self,
                                                              style: UITableViewCell.CellStyle = .default,
                                                              for indexPath: IndexPath? = nil,
                                                              configure: ((T) -> Void)? = nil) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            let cell = T(style: style, reuseIdentifier: T.identifier)
            configure?(cell)
            return cell
        }
        return cell
    }
}
