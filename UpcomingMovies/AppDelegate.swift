//
//  AppDelegate.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 01/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = RootViewController()
        let windowFrame = UIScreen.main.bounds
        
        window = UIWindow(frame: windowFrame)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
