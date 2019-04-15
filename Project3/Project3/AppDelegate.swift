//
//  AppDelegate.swift
//  Project3
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigationViewController = storyboard.instantiateInitialViewController() as? UINavigationController, let viewController = navigationViewController.topViewController as? StormViewerViewController else {
            return false
        }
        
        let interactor = StormViewerInteractor()
        let router = StormViewerRouter(interactor: interactor)
        router.assemble(viewController: viewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()

        return true
    }

}

