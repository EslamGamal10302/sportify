//
//  LeaguesViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit
import SDWebImage
import Reachability

class LeaguesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,LeaguesViewProtocol {
    
    var leaguesArray:[League]?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    var leaguesPresenter : LeaguesPresenterProtocol?
    let networkIndicator=UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate=self
        leaguesArray=[League]()
        networkIndicator.color=UIColor(named: "button")
        networkIndicator.center=view.center
        view.addSubview(networkIndicator)
        leaguesPresenter?.getAllLeaguesDetails()

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
    func updateTable(data: [League]) {
        self.leaguesArray = data
        self.myTable.reloadData()
    }
    func startLoadingAnimation() {
        self.networkIndicator.startAnimating()
    }
    
    func endLoadingAnimation() {
        self.networkIndicator.stopAnimating()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return leaguesArray?.count ?? 0
  
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! LeaguesViewCell
        cell.leagues_title.text=leaguesArray?[indexPath.row].league_name
        cell.leagues_image.sd_setImage(with: URL(string: (leaguesArray?[indexPath.row].league_logo) ?? ""), placeholderImage: UIImage(named: "empty"))
        cell.leagues_image.layer.cornerRadius = cell.leagues_image.frame.size.width / 2
        cell.leagues_image.clipsToBounds = true
        cell.container.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.35) {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search changed")
        if searchText.count > 0 {
            leaguesPresenter?.searchInLeagues(with: searchText)
          } else {
              leaguesPresenter?.endSearching()
              DispatchQueue.main.async {
                  searchBar.resignFirstResponder()
              }
          }
    }
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("keyboard")
        searchBar.resignFirstResponder()
    }
    func searchInLeaguesResults(result: [League]) {
        self.leaguesArray=result
        self.myTable.reloadData()
    }
    
    func endSearching(result: [League]) {
        self.leaguesArray=result
        self.myTable.reloadData()
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reachability = try! Reachability()
        if reachability.connection == .unavailable {
            self.showAlert(title: "No Internet Connection", message: "there is no internet connection to fetch data , please reconnect and try again")
        } else {
            
            leaguesPresenter?.navigateToLeagueDetailsScreen(leagueID: (leaguesArray?[indexPath.row].league_key)!, view: self)
        }
        
    }


}
