//
//  AppDelegate.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        UINavigationBar.appearance().largeTitleTextAttributes   = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes        = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        
        let navigationController = UINavigationController()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let appCoordinator = AppCoordinator(navController: navigationController)
        appCoordinator.start()
        
    
        return true
    }
    
    
    func createMainNavigationController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        initialViewController.title = "Main"
        initialViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        return UINavigationController(rootViewController: initialViewController)
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor     = .systemGreen
        UITabBar.appearance().barTintColor  = UIColor(named: "mainBackground")
        tabBar.viewControllers = [createMainNavigationController()]
            return tabBar
    }
}

