//
//  OnBoardingPresenter.swift
//  sportify
//
//  Created by Eslam gamal on 22/05/2023.
//

import Foundation
import UIKit

class OnBoardingPresenter:OnBoardingPresenterProtocol {
    var onBoardingPageView : OnBoardingPageProtocol?
    
    
    init(onBoardingPageView: OnBoardingPageProtocol? = nil) {
        self.onBoardingPageView = onBoardingPageView
    }
    
    
    func createOnBoardingScreens() {
        let screenArrays = OnBoardScreen.createOnBoardingScreens()
        self.onBoardingPageView?.updateOnBoardingScreens(pageScreens: screenArrays)
    }
    
    
}
