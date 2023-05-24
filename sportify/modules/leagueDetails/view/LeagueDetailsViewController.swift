//
//  LeagueDetailsViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit
import SDWebImage

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,LeagueDetailsViewProtocol {
    
    @IBOutlet weak var upcomingCollection: UICollectionView!
    @IBOutlet weak var latestResultTable: UITableView!
    @IBOutlet weak var TeamesTable: UICollectionView!
    var upcommingArray=[UpcomingFixtureDisplayedData]()
    var resultsArray=[LatestResultDisplayedData]()
    var teamsArray=[TeamDisplayedData]()
    var leagueDetailPresenter:LeagueDetailsPresenterProtocol?
    var sportType:String!    // must deleted
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailPresenter?.getScreendata()
        sportType = leagueDetailPresenter?.getSportType()   // must delted

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
            return self.upcommingArray.count
        }else {
            return self.teamsArray.count
        }
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upcomingCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as!UpcomingViewCell
            cell.homeTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].FirstTeamImage ?? ""), placeholderImage: UIImage(named: "empty"))
            cell.homeTeamImage.layer.cornerRadius = cell.homeTeamImage.frame.size.width / 2
            cell.homeTeamName.text=upcommingArray[indexPath.row].FirstTeamName
            cell.awayTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].SecondTeamImage ?? ""), placeholderImage: UIImage(named: "empty"))
            cell.awayTeamImage.layer.cornerRadius = cell.awayTeamImage.frame.size.width / 2
            cell.awayTeamName.text=upcommingArray[indexPath.row].SecondTeamName
            cell.matchDate.text=upcommingArray[indexPath.row].MatchDate
            cell.matchTime.text=upcommingArray[indexPath.row].MatchTime
            cell.layer.cornerRadius = 20
             cell.layer.masksToBounds = true
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsViewCell
            cell.teamImage.sd_setImage(with: URL(string: teamsArray[indexPath.row].teamLogo ?? ""), placeholderImage: UIImage(named: "empty"))
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
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! LatestResultsViewCell
        cell.homeTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].FirstTeamImage ?? ""), placeholderImage: UIImage(named: "empty"))
        cell.homeTeamImage.layer.cornerRadius = cell.homeTeamImage.frame.size.width / 2
        cell.homeTeamName.text=resultsArray[indexPath.row].FirstTeamName
        cell.awayTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].SecondTeamImage ?? ""), placeholderImage: UIImage(named: "empty"))
        cell.awayTeamImage.layer.cornerRadius = cell.awayTeamImage.frame.size.width / 2
        cell.awayTeamName.text=resultsArray[indexPath.row].SecondTeamName
        cell.totalResult.text=resultsArray[indexPath.row].matchResult
        cell.container.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func updateUpcomingFixtures(fixtures: [UpcomingFixtureDisplayedData]) {
        self.upcommingArray=fixtures
        self.upcomingCollection.reloadData()
    }
    
    func updateLatestResult(results: [LatestResultDisplayedData]) {
        self.resultsArray=results
        self.latestResultTable.reloadData()
    }
    
    func updateAllTeams(teams: [TeamDisplayedData]) {
        self.teamsArray=teams
        self.TeamesTable.reloadData()
    }
    
}
