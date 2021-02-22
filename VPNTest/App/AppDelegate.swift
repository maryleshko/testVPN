//
//  AppDelegate.swift
//  VPNTest
//
//  Created by Mary on 20.02.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let assembly = Assembly()
    var navigator: Navigator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            self.navigator = Navigator(window: window, assembly: assembly)
            navigator?.setupWindow()
        }
        
        window?.makeKeyAndVisible()
        return true
    }
}

