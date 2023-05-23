//
//  WelcomePresenter.swift
//  sportify
//
//  Created by Eslam gamal on 22/05/2023.
//

import Foundation
import UIKit

class WelcomePresenter:WelcomePresenterProtocol {

    
    var welcomeScreen : WelcomeViewProtocol?
    init(welcomeScreen: WelcomeViewProtocol? = nil) {
        self.welcomeScreen = welcomeScreen
    }
    
    func startAnimation() {
        welcomeScreen?.showAnimation()
    }
    
    func NavigationToNextScreen(screen: UIViewController) {
        let userDefault=UserDefaults.standard
        if userDefault.bool(forKey: "loginBefore") {
            let home = screen.storyboard?.instantiateViewController(identifier: "home") as! UITabBarController
            home.modalPresentationStyle = .fullScreen
            home.modalTransitionStyle = .crossDissolve
            screen.present(home, animated: true)
        } else {
            let splashView = screen.storyboard?.instantiateViewController(identifier: "page") as! OnBoardingPageController
            splashView.modalPresentationStyle = .fullScreen
            splashView.modalTransitionStyle =   .crossDissolve
            screen.present(splashView,animated: true,completion: nil)
        }
    }
   
}
