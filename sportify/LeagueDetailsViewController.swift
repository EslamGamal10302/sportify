//
//  LeagueDetailsViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var upcomingCollection: UICollectionView!
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!UpcomingViewCell
        cell.homeTeamImage.image=UIImage(named: "splash")
        cell.homeTeamName.text="Barcelona"
        cell.awayTeamImage.image=UIImage(named: "one")
        cell.awayTeamName.text="Al-Ahly"
        cell.matchDate.text="05-06-2023"
        cell.matchTime.text="21:00"
        cell.layer.cornerRadius = 20
         cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width*0.95), height: (collectionView.bounds.height*0.9))
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
