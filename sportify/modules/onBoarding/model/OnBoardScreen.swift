//
//  Screen.swift
//  sportify
//
//  Created by Eslam gamal on 22/05/2023.
//

import Foundation
import UIKit

class OnBoardScreen {
    static func createOnBoardingScreens()->[UIViewController]{
        var onBoardingViewsArray = [UIViewController]()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstOnBoardingView = storyboard.instantiateViewController(identifier: "boarding")
        as! OnBoardingViewController
        firstOnBoardingView.text="Explore the exciting world of sports with our comprehensive coverage of news, highlights, and timelines. Stay up-to-date with the latest happenings across various sports and leagues. Get ready to immerse yourself in the world of sports!"
        firstOnBoardingView.image=UIImage(named: "one")!
        
        let secondOnBoardingView = storyboard.instantiateViewController(identifier: "boarding")
        as! OnBoardingViewController
        secondOnBoardingView.text="Stay informed about the latest sports news and catch up on the most exciting moments with our app. Whether it's football, basketball, cricket, tennis, or any other sport, we've got you covered. Join us and never miss a beat in the world of sports!"
        secondOnBoardingView.image=UIImage(named: "two")!
        
        let thirdOnBoardingView = storyboard.instantiateViewController(identifier: "boarding")
        as! OnBoardingViewController
        thirdOnBoardingView.text="Make the app truly yours by adding your favorite teams to your personalized list. Stay connected with all the latest news, highlights, and updates about your favorite teams. Enjoy quick and easy access to everything that matters to you in the world of sports. Tailor your sports experience like never before!"
        thirdOnBoardingView.image=UIImage(named: "three")!
        thirdOnBoardingView.status=true
        onBoardingViewsArray.append(firstOnBoardingView)
        onBoardingViewsArray.append(secondOnBoardingView)
        onBoardingViewsArray.append(thirdOnBoardingView)
        
        return onBoardingViewsArray
    }
    
}
