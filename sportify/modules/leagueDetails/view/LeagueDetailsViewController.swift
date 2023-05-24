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
    let upcomingNetworkIndicator=UIActivityIndicatorView(style: .large)
    let latestResultNetworkIndicator=UIActivityIndicatorView(style: .large)
    let teamsNetworkIndicator=UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailPresenter?.getScreendata()
        sportType = leagueDetailPresenter?.getSportType()   // must delted
        self.setupLoadingIndicators()

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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == TeamesTable {
            self.leagueDetailPresenter?.navigateToTeamDetailsScreen(teamId: teamsArray[indexPath.row].teamId, view: self)
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
        upcomingNetworkIndicator.stopAnimating()
        self.upcommingArray=fixtures
        self.upcomingCollection.reloadData()
        if fixtures.isEmpty {
            self.addEmptyResultStatusSubview(view: self.upcomingCollection)
        }
    }
    
    func updateLatestResult(results: [LatestResultDisplayedData]) {
        latestResultNetworkIndicator.stopAnimating()
        self.resultsArray=results
        self.latestResultTable.reloadData()
        if results.isEmpty {
            self.addEmptyResultStatusSubview(view: self.latestResultTable)
        }
    }
    
    func updateAllTeams(teams: [TeamDisplayedData]) {
        teamsNetworkIndicator.stopAnimating()
        self.teamsArray=teams
        self.TeamesTable.reloadData()
        if teams.isEmpty {
            self.addEmptyResultStatusSubview(view: self.TeamesTable)
        }
    }
    func setupLoadingIndicators(){
        let yOffset: CGFloat = -200
        upcomingNetworkIndicator.color=UIColor(named: "button")
        upcomingNetworkIndicator.center=CGPoint(x: self.upcomingCollection.bounds.width/2, y: self.upcomingCollection.bounds.height/2)
        upcomingCollection.addSubview(upcomingNetworkIndicator)
        upcomingNetworkIndicator.startAnimating()
        
      
        latestResultNetworkIndicator.color=UIColor(named: "button")
        latestResultNetworkIndicator.center = CGPoint(x: latestResultTable.center.x, y: latestResultTable.center.y + yOffset)
        latestResultTable.addSubview(latestResultNetworkIndicator)
        latestResultNetworkIndicator.startAnimating()
        
        
        teamsNetworkIndicator.color=UIColor(named: "button")
        teamsNetworkIndicator.center=CGPoint(x: self.TeamesTable.bounds.width/2, y: self.TeamesTable.bounds.height/4)
        TeamesTable.addSubview(teamsNetworkIndicator)
        teamsNetworkIndicator.isHidden = false
        TeamesTable.bringSubviewToFront(teamsNetworkIndicator)
        teamsNetworkIndicator.startAnimating()
        
     
    }

    func addEmptyResultStatusSubview(view :UIView){
        let labelWidth: CGFloat = view.bounds.width/2
           let labelHeight: CGFloat = view.bounds.height/2
           let labelX = (view.bounds.width - labelWidth) / 2
           let labelY = (view.bounds.height - labelHeight) / 2
           let msg = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight))
           msg.text = "No data to display"
           msg.textAlignment = .center
           msg.textColor=UIColor(named: "text")
           view.addSubview(msg)
    }
    func showNavigationAlertError() {
        let alert = UIAlertController(title: "Unexpected Error", message: "There are no details for the selected team", preferredStyle: .alert)
           alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "launch")
           let attributedTitle = NSAttributedString(string: "Unexpected Error", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")])
           alert.setValue(attributedTitle, forKey: "attributedTitle")
           let attributedMessage = NSAttributedString(string: "There are no details for the selected team", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")])
           alert.setValue(attributedMessage, forKey: "attributedMessage")
           present(alert, animated: true)
           Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
               alert.dismiss(animated: true, completion: nil)
           }
    }
    
}
