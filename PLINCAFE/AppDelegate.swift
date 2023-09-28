//
//  AppDelegate.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 28.09.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        MainRouter.shared.showMainScreen()

        return true
    }
}

