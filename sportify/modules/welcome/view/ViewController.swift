//
//  ViewController.swift
//  sportify
//
//  Created by Eslam gamal on 19/05/2023.
//

import UIKit

class ViewController: UIViewController,WelcomeViewProtocol {
 
    @IBOutlet weak var launchImage: UIImageView!
    @IBOutlet weak var launchLabel: UILabel!
    
    var welcomeProtocol : WelcomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeProtocol = WelcomePresenter(welcomeScreen: self)
        welcomeProtocol?.startAnimation()
       
    }
    
    func showAnimation() {
        UIView.animate(withDuration: 2,animations: {
                self.launchImage.frame = CGRect(x:  self.launchImage.frame.minX-120, y:  self.launchImage.frame.minY-120, width:  self.launchImage.frame.width + 240, height:  self.launchImage.frame.height + 240)
            
        }) { completion in
            if completion {
                self.labelAnimation()
             
            }
        }
    }
    func labelAnimation(){
        UIView.animate(withDuration: 1,animations: {  self.launchLabel.alpha=1}){
            completion in
               if completion {
                   let userDefault=UserDefaults.standard
                   if userDefault.bool(forKey: "loginBefore") {
                       let home = self.storyboard?.instantiateViewController(identifier: "home") as! UITabBarController
                       home.modalPresentationStyle = .fullScreen
                       home.modalTransitionStyle = .crossDissolve
                       self.present(home, animated: true)
                   } else {
                       let splashView = self.storyboard?.instantiateViewController(identifier: "page") as! OnBoardingPageController
                       splashView.modalPresentationStyle = .fullScreen
                       splashView.modalTransitionStyle =   .crossDissolve
                       self.present(splashView,animated: true,completion: nil)
                   }
                   
                
               }
        }
    }
    


}

