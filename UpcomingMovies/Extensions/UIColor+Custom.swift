//
//  UIColor+Custom.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 10/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    public static var appGreen: UIColor { return UIColor(1, 210, 119) }
}
