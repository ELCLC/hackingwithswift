//
//  AppDelegate.swift
//  Project2
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigationViewController = storyboard.instantiateInitialViewController() as? UINavigationController,
            let viewController = navigationViewController.topViewController as? ViewController else {
            return false
        }
        
        let router = FlagRouter()
        router.assemble(viewController: viewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

