//
//  AppDelegate.swift
//  deddit
//
//  Created by Dan Christal on 2017-04-20.
//  Copyright © 2017 Dan Christal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //setup main window without using storyboard
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let postViewController = PostViewController()
        postViewController.store = PostStore()
        
        window?.rootViewController = postViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

