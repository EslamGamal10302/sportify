//
//  LeaguesViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit
import SDWebImage

class LeaguesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,LeaguesViewProtocol {
    
    
  
    var leaguesArray:[League]?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    var leaguesPresenter : LeaguesPresenterProtocol?
    var sportType : String?
    let networkIndicator=UIActivityIndicatorView(style: .large)
    var isSearching = false
    var filteredLeaguesArray = [League]()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate=self
        leaguesArray=[League]()
        networkIndicator.color=UIColor(named: "button")
        networkIndicator.center=view.center
        view.addSubview(networkIndicator)
        leaguesPresenter = LeaguesPresenter(leaguesScreen: self,networkService: NetworkService.getInstance)
        leaguesPresenter?.getAllLeaguesDetails(leagueName: sportType!)

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
        if isSearching {
           return filteredLeaguesArray.count
        }else {
            return leaguesArray?.count ?? 0
        }
  
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! LeaguesViewCell
        
        if isSearching {
            cell.leagues_title.text=filteredLeaguesArray[indexPath.row].league_name
            cell.leagues_image.sd_setImage(with: URL(string: (filteredLeaguesArray[indexPath.row].league_logo) ?? ""), placeholderImage: UIImage(named: "empty"))
            cell.leagues_image.layer.cornerRadius = cell.leagues_image.frame.size.width / 2
            cell.leagues_image.clipsToBounds = true
            cell.container.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            return cell
        }else {
            cell.leagues_title.text=leaguesArray?[indexPath.row].league_name
            cell.leagues_image.sd_setImage(with: URL(string: (leaguesArray?[indexPath.row].league_logo) ?? ""), placeholderImage: UIImage(named: "empty"))
            cell.leagues_image.layer.cornerRadius = cell.leagues_image.frame.size.width / 2
            cell.leagues_image.clipsToBounds = true
            cell.container.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            return cell
        }
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
              self.isSearching = true
            self.filteredLeaguesArray = self.leaguesArray!.filter({ league in
                return league.league_name!.contains(searchText.replacingOccurrences(of: " ", with: ""))
            })
          } else {
              self.isSearching = false
              self.filteredLeaguesArray = []
          }
          
          self.myTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("keyboard")
        searchBar.resignFirstResponder()
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchkeyboard")
        self.view.endEditing(true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailsView = self.storyboard?.instantiateViewController(identifier: "leaguesDetails")
        as! LeagueDetailsViewController
        self.navigationController?.pushViewController(leagueDetailsView, animated: true)
    }


}
