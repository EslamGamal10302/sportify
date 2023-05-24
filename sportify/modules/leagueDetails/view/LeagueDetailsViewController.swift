//
//  LeagueDetailsViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit
import SDWebImage

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,LeagueDetailsViewProtocol {
    func updateUpcomingFixtures(fixtures: [Upcoming]) {
        self.upcommingArray=fixtures
        self.upcomingCollection.reloadData()
    }
    
    func updateLatestResult(results: [LatestResult]) {
        self.resultsArray=results
        self.latestResultTable.reloadData()
    }
    
    func updateAllTeams(teams: [Team]) {
        self.teamsArray=teams
        self.TeamesTable.reloadData()
    }
    
   
    
    @IBOutlet weak var upcomingCollection: UICollectionView!
    @IBOutlet weak var latestResultTable: UITableView!
    @IBOutlet weak var TeamesTable: UICollectionView!
    var upcommingArray=[Upcoming]()
    var resultsArray=[LatestResult]()
    var teamsArray=[Team]()
    var leagueDetailPresenter:LeagueDetailsPresenterProtocol?
    var sportType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailPresenter?.getScreendata()
        sportType = leagueDetailPresenter?.getSportType()

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
            
            
            
            if sportType == "football"{
                cell.homeTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].home_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
            } else if sportType == "tennis"{
                cell.homeTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].event_first_player_logo ?? ""), placeholderImage: UIImage(named: "empty"))
            } else {
                cell.homeTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].event_home_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
            }
            
            
            
            
            
         
            
            
            cell.homeTeamImage.layer.cornerRadius = cell.homeTeamImage.frame.size.width / 2
            if sportType == "tennis"{
                cell.homeTeamName.text=upcommingArray[indexPath.row].event_first_player
            }else{
                cell.homeTeamName.text=upcommingArray[indexPath.row].event_home_team
            }
            
            
            
            
            
            if sportType == "football"{
                cell.awayTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].away_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
            } else if sportType == "tennis"{
                cell.awayTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].event_second_player_logo ?? ""), placeholderImage: UIImage(named: "empty"))
            } else {
                cell.awayTeamImage.sd_setImage(with: URL(string: upcommingArray[indexPath.row].event_away_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
            }
            
            cell.awayTeamImage.layer.cornerRadius = cell.awayTeamImage.frame.size.width / 2
            
            if sportType == "tennis"{
                cell.awayTeamName.text=upcommingArray[indexPath.row].event_second_player
            } else{
                cell.awayTeamName.text=upcommingArray[indexPath.row].event_away_team
            }
            
            if sportType == "cricket"{
                cell.matchDate.text=upcommingArray[indexPath.row].event_date_start
            }else {
                cell.matchDate.text=upcommingArray[indexPath.row].event_date
            }
       
            
            
            
            cell.matchTime.text=upcommingArray[indexPath.row].event_time
            cell.layer.cornerRadius = 20
             cell.layer.masksToBounds = true
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsViewCell
           // cell.teamImage.layer.cornerRadius = cell.teamImage.frame.size.width/2
            cell.teamImage.sd_setImage(with: URL(string: teamsArray[indexPath.row].team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
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
        
        if sportType == "football"{
            cell.homeTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].home_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
        } else if sportType == "tennis" {
            cell.homeTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].event_first_player_logo ?? ""), placeholderImage: UIImage(named: "empty"))
        }else {
            cell.homeTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].event_home_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
        }
        
        cell.homeTeamImage.layer.cornerRadius = cell.homeTeamImage.frame.size.width / 2
        if sportType == "tennis"{
            cell.homeTeamName.text=resultsArray[indexPath.row].event_first_player
        }else {
            cell.homeTeamName.text=resultsArray[indexPath.row].event_home_team
        }
    
        
        if sportType == "football"{
            cell.awayTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].away_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
        } else if sportType == "tennis"{
            cell.awayTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].event_second_player_logo ?? ""), placeholderImage: UIImage(named: "empty"))
            
        }else{
            cell.awayTeamImage.sd_setImage(with: URL(string: resultsArray[indexPath.row].event_away_team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
        }
        
        
        cell.awayTeamImage.layer.cornerRadius = cell.awayTeamImage.frame.size.width / 2
        if sportType == "tennis"{
            cell.awayTeamName.text=resultsArray[indexPath.row].event_second_player
        }else{
            cell.awayTeamName.text=resultsArray[indexPath.row].event_away_team
        }
      
        
        
        if sportType == "cricket"{
            cell.totalResult.text=resultsArray[indexPath.row].event_home_final_result
        }else{
            cell.totalResult.text=resultsArray[indexPath.row].event_final_result
        }
    
        
        
        cell.container.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
