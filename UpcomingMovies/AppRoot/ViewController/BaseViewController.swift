//
//  BaseViewController.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class BaseViewController<View: UIView>: UIViewController {
    public lazy var mainView: View = View()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override open func loadView() {
        mainView.backgroundColor = mainView.backgroundColor ?? .white
        view = mainView
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
