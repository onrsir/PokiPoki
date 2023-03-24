//
//  SplashViewController.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//


import UIKit
import Lottie

class SplashViewController: UIViewController {
    let animationView = AnimationView()
    
    var showTabBarController : (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myYellow = UIColor(named: "electric")

        view.backgroundColor = myYellow
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.showTabBarController?()
        }
        setupAnimation()
    }
    
    func setupAnimation() {
        animationView.animation          = Animation.named("pokemon")
        animationView.frame.size.width   = (view.frame.size.width)  * 0.84
        animationView.frame.size.height  = (view.frame.size.height) * 0.26
        animationView.center = CGPoint(x: view.frame.size.width  / 2 - 20,
                                     y: view.frame.size.height / 2)
        animationView.contentMode        = .scaleAspectFill
        animationView.loopMode           = .repeat(2)
        animationView.play()
        view.addSubview(animationView)
    }}
