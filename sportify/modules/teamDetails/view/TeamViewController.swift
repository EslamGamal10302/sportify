//
//  TeamViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit

class TeamViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.team_name.text="Barcelona"
        self.team_coach.text="Eslam Gamal"
        self.team_image.image=UIImage(named: "one")
   
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        tabBarController?.tabBar.isHidden = true
    }

    
    @IBOutlet weak var team_image: UIImageView!
    @IBOutlet weak var team_name: UILabel!
    @IBOutlet weak var team_coach: UILabel!
    
    @IBAction func addToFavorite(_ sender: UIButton) {
        
        
        
    }
    @IBOutlet weak var playersCollertionView: UICollectionView!
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlayerCollectionViewCell
        cell.playerPosition.text = "Midfilder"
        cell.player_age.text = "27"
        cell.player_name.text="Eslam Gamal"
        cell.player_number.text = "10"
        cell.player_image.image=UIImage(named: "splash")
        cell.player_image.layer.cornerRadius = cell.player_image.frame.size.width / 2
        cell.player_image.clipsToBounds = true
        cell.layer.cornerRadius = 20
         cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width*0.45), height: (collectionView.bounds.width*0.71))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
    }
    

    
}
