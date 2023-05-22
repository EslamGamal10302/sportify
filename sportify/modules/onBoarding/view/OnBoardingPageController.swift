//
//  OnBoardingPageController.swift
//  sportify
//
//  Created by Eslam gamal on 19/05/2023.
//

import UIKit

class OnBoardingPageController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    var onBoardingViewsArray = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "launch")
        delegate = self
        dataSource = self
        self.setupOnBoardingViews()
        if let firstView = onBoardingViewsArray.first{
            setViewControllers([firstView], direction: .forward, animated: true,completion: nil)
        }
    }
    
    func setupOnBoardingViews(){
        let firstOnBoardingView = self.storyboard?.instantiateViewController(identifier: "boarding")
        as! OnBoardingViewController
        firstOnBoardingView.text="Explore the exciting world of sports with our comprehensive coverage of news, highlights, and timelines. Stay up-to-date with the latest happenings across various sports and leagues. Get ready to immerse yourself in the world of sports!"
        firstOnBoardingView.image=UIImage(named: "one")!
        
        let secondOnBoardingView = self.storyboard?.instantiateViewController(identifier: "boarding")
        as! OnBoardingViewController
        secondOnBoardingView.text="Stay informed about the latest sports news and catch up on the most exciting moments with our app. Whether it's football, basketball, cricket, tennis, or any other sport, we've got you covered. Join us and never miss a beat in the world of sports!"
        secondOnBoardingView.image=UIImage(named: "two")!
        
        let thirdOnBoardingView = self.storyboard?.instantiateViewController(identifier: "boarding")
        as! OnBoardingViewController
        thirdOnBoardingView.text="Make the app truly yours by adding your favorite teams to your personalized list. Stay connected with all the latest news, highlights, and updates about your favorite teams. Enjoy quick and easy access to everything that matters to you in the world of sports. Tailor your sports experience like never before!"
        thirdOnBoardingView.image=UIImage(named: "three")!
        thirdOnBoardingView.status=true
        self.onBoardingViewsArray.append(firstOnBoardingView)
        self.onBoardingViewsArray.append(secondOnBoardingView)
        self.onBoardingViewsArray.append(thirdOnBoardingView)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = onBoardingViewsArray.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        return onBoardingViewsArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = onBoardingViewsArray.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = currentIndex + 1
        guard nextIndex < onBoardingViewsArray.count else {
            return nil
        }
        return onBoardingViewsArray[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return onBoardingViewsArray.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
