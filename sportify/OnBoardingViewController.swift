//
//  OnBoardingViewController.swift
//  sportify
//
//  Created by Eslam gamal on 19/05/2023.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var boardingImage: UIImageView!
    @IBOutlet weak var boardingLabel: UILabel!
    var text:String?
    var image:UIImage?
    var status = false
    override func viewDidLoad() {
        super.viewDidLoad()
        boardingLabel.text=text
        boardingImage.image=image
        if status {
            skipButton.alpha=1
        }
    }

    
    @IBAction func skipaction(_ sender: UIButton) {
        let userDefault=UserDefaults.standard
        userDefault.setValue(true, forKey: "loginBefore")
        let home = self.storyboard?.instantiateViewController(identifier: "test") as!EslamViewController
        home.modalPresentationStyle = .fullScreen
        home.modalTransitionStyle = .crossDissolve
        present(home, animated: true)
    }
    
    

}
