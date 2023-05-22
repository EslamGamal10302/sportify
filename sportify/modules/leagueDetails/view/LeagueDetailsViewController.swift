//
//  LeagueDetailsViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var upcomingCollection: UICollectionView!
    @IBOutlet weak var latestResultTable: UITableView!
    @IBOutlet weak var TeamesTable: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == upcomingCollection {
            return 1
        }else {
            return 1
        }
  
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == upcomingCollection {
            return 10
        }else {
            return 10
        }
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upcomingCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as!UpcomingViewCell
            cell.homeTeamImage.image=UIImage(named: "craket")
            cell.homeTeamImage.layer.cornerRadius = cell.homeTeamImage.frame.size.width / 2
            cell.homeTeamName.text="Barcelona"
            cell.awayTeamImage.image=UIImage(named: "craket")
            cell.awayTeamImage.layer.cornerRadius = cell.awayTeamImage.frame.size.width / 2
            cell.awayTeamName.text="Al-Ahly"
            cell.matchDate.text="05-06-2023"
            cell.matchTime.text="21:00"
            cell.layer.cornerRadius = 20
             cell.layer.masksToBounds = true
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsViewCell
            cell.teamImage.image=UIImage(named: "splash")
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == upcomingCollection {
            return CGSize(width: (collectionView.bounds.width*0.95), height: (collectionView.bounds.height*0.9))
        } else {
            print("Collection")
            return CGSize(width: (collectionView.bounds.width*0.25), height: (collectionView.bounds.height*0.8))
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == upcomingCollection {
            return 15
        } else{
            print("Collection2")
            return 15
        
        }
     
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == upcomingCollection {
            return 0.1
        } else {
            print("Collection3")
            return 0.1
     
        }
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == upcomingCollection {
            return UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
        } else {
            print("Collection4")
            return UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
        
        }
    
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! LatestResultsViewCell
        cell.homeTeamImage.image=UIImage(named: "craket")
        cell.homeTeamImage.layer.cornerRadius = cell.homeTeamImage.frame.size.width / 2
        cell.homeTeamName.text="Barcelona"
        cell.awayTeamImage.image=UIImage(named: "craket")
        cell.awayTeamImage.layer.cornerRadius = cell.awayTeamImage.frame.size.width / 2
        cell.awayTeamName.text="Al-Ahly"
        cell.totalResult.text="2-2"
        cell.container.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
