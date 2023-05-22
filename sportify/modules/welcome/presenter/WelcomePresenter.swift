//
//  WelcomePresenter.swift
//  sportify
//
//  Created by Eslam gamal on 22/05/2023.
//

import Foundation

class WelcomePresenter:WelcomePresenterProtocol {
    var welcomeScreen : WelcomeViewProtocol?
    init(welcomeScreen: WelcomeViewProtocol? = nil) {
        self.welcomeScreen = welcomeScreen
    }
    
    func startAnimation() {
        welcomeScreen?.showAnimation()
    }
}
