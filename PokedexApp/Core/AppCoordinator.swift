//
//  AppCoordinator.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

//  Created by Onur Sir on 22.03.2023.
//

import Foundation
import UIKit


class AppCoordinator {
    
    let navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        initialViewController.showTabBarController = showTabBarController
        initialViewController.title = ""
        self.navController.pushViewController(initialViewController, animated: false)
    }
    
    private func showTabBarController() {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor     = .systemGreen
        UITabBar.appearance().barTintColor  = UIColor(named: "mainBackground")
        tabBar.viewControllers = [createMainNavigationController()]
        self.navController.viewControllers = [tabBar]
 
        tabBar.tabBar.isHidden = true
    }
    
    
    func createMainNavigationController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        initialViewController.title = "Main"
        initialViewController.tabBarItem = UITabBarItem(tabBarSystemItem:.contacts , tag: 0)
        return UINavigationController(rootViewController: initialViewController)
    }
    
   
}
