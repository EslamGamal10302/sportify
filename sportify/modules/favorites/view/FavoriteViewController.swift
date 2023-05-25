//
//  FavoriteViewController.swift
//  sportify
//
//  Created by Eslam gamal on 20/05/2023.
//

import UIKit
import SDWebImage

class FavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,FavoriteViewProtocol {
  
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    var favoritePresenter:FavoriteTeamsPresenterProtocol?
    var favoriteteamsArray:[FavoriteTeamsDisplay]?
    let loadingNetworkIndicator=UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        print("will appear")
        searchBar.delegate=self
        prepareloadingNetworkIndicator()
        favoriteteamsArray=[FavoriteTeamsDisplay]()
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = false
        favoritePresenter = FavoriteTeamsPresenter(view: self,dataBaseService: DataBaseService.getInstance)
        favoritePresenter?.getAllFavoriteTeams()
        
    }
    
    func updateView(data: [FavoriteTeamsDisplay]) {
        self.loadingNetworkIndicator.stopAnimating()
        self.favoriteteamsArray=data
        print(data)
        self.myTable.reloadData()
        if data.isEmpty{
            addEmptyResultStatusSubview()
        }
     
    }
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteteamsArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! FavoriteViewCell
        cell.fav_label.text=favoriteteamsArray?[indexPath.row].teamName
        cell.fav_image.sd_setImage(with: URL(string: favoriteteamsArray?[indexPath.row].teamImage ?? ""), placeholderImage: UIImage(named: "empty"))
        cell.fav_image.layer.cornerRadius = cell.fav_image.frame.size.width / 2
         cell.fav_image.clipsToBounds = true
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamDetails = self.storyboard?.instantiateViewController(identifier: "teamDetails") as!TeamViewController
        self.navigationController?.pushViewController(teamDetails, animated: true)
    }
    func  prepareloadingNetworkIndicator(){
        loadingNetworkIndicator.color=UIColor(named: "button")
        loadingNetworkIndicator.center=view.center
        view.addSubview(loadingNetworkIndicator)
        loadingNetworkIndicator.startAnimating()
    }
   
    func addEmptyResultStatusSubview(){
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search changed")
        if searchText.count > 0 {
            favoritePresenter?.searchInTeams(with: searchText)
          } else {
              favoritePresenter?.endSearching()
              DispatchQueue.main.async {
                  searchBar.resignFirstResponder()
              }
          }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("keyboard")
        searchBar.resignFirstResponder()
    }
    func searchInTeamsResults(result: [FavoriteTeamsDisplay]) {
        self.favoriteteamsArray=result
        self.myTable.reloadData()
    }
    
    func endSearching(result: [FavoriteTeamsDisplay]) {
        self.favoriteteamsArray=result
        self.myTable.reloadData()
    }
}
