//
//  UICollectionView+Extensions.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

// MARK: UITableViewCell
public extension UICollectionView {
    @discardableResult
    final public func register<T: UICollectionViewCell>(withClass cellClass: T.Type) -> UICollectionView {
        register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
        return self
    }
}
