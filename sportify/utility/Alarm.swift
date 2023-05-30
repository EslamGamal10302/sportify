//
//  Alarm.swift
//  sportify
//
//  Created by Eslam gamal on 30/05/2023.
//

import Foundation
import UIKit
extension UIViewController{
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "launch")
     let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
        alert.setValue(attributedTitle, forKey: "attributedTitle")
     let attributedMessage = NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
        alert.setValue(attributedMessage, forKey: "attributedMessage")
           present(alert, animated: true)
           Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
               alert.dismiss(animated: true, completion: nil)
           }
    }
}
