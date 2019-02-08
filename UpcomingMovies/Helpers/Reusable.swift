//
//  Reusable.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

public protocol Reusable {
    static var identifier: String { get }
}

public extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Reusable {}
extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionReusableView: Reusable {}
