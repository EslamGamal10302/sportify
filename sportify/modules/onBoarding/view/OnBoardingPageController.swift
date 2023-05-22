//
//  OnBoardingPageController.swift
//  sportify
//
//  Created by Eslam gamal on 19/05/2023.
//

import UIKit

class OnBoardingPageController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource,OnBoardingPageProtocol {
    
    var onBoardingViewsArray = [UIViewController]()
    
    var onBoardingPresenter:OnBoardingPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "launch")
        delegate = self
        dataSource = self
        onBoardingPresenter = OnBoardingPresenter(onBoardingPageView: self)
        onBoardingPresenter?.createOnBoardingScreens()
    }
    
    

    func updateOnBoardingScreens(pageScreens: [UIViewController]) {
        onBoardingViewsArray  = pageScreens
        if let firstView = onBoardingViewsArray.first{
            setViewControllers([firstView], direction: .forward, animated: true,completion: nil)
        }
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
