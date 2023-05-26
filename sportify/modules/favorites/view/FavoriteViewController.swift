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
    var emptyDataMessage:UILabel?
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
        }else {
            self.emptyDataMessage?.removeFromSuperview()
        }
     
    }
    func updateViewAfterDeleteItem(itemIndexPath:IndexPath){
        self.favoriteteamsArray?.remove(at: itemIndexPath.row)
        self.myTable.reloadData()
        if favoriteteamsArray!.isEmpty {
            self.addEmptyResultStatusSubview()
        }else {
            self.emptyDataMessage?.removeFromSuperview()
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
        cell.remove_action_button.tag=indexPath.row
        cell.remove_action_button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
            let itemIndexPath = IndexPath(row: sender.tag, section: 0)
        let selectedTeam=(favoriteteamsArray?[itemIndexPath.row])!
        self.confirmationForDelete(itemIndexPath: itemIndexPath, selectedTeam: selectedTeam)
        }
    
    func confirmationForDelete(itemIndexPath:IndexPath,selectedTeam:FavoriteTeamsDisplay){
        let alert=UIAlertController(title: "Confirmation request", message: "Are you sure you want to delete this team from your favorite list?", preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "launch")
        let attributedTitle = NSAttributedString(string: "Confirmation request", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessage = NSAttributedString(string: "Are you sure you want to delete this team from your favorite list?", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedMessage, forKey: "attributedMessage")
        let confirm=UIAlertAction(title: "confirm", style: .destructive){[self]
            action in
            self.favoritePresenter?.deleteTeam(itemIndexPath: itemIndexPath, teamId: selectedTeam.teamId)
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
   
    
    func showDeleteSuccessalert(){
        let alert = UIAlertController(title: "Deleted successfully", message: "team deleted successfully from your favorite list you can't display it again", preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "launch")
        let attributedTitle = NSAttributedString(string: "Deleted successfully", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessage = NSAttributedString(string: "team deleted successfully from your favorite list you can't display it again", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedMessage, forKey: "attributedMessage")
        present(alert, animated: true)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
    }
    func showDeleteErrorAlert(){
        let alert = UIAlertController(title: "Unexpected Error", message: "can't delete this team", preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "launch")
        let attributedTitle = NSAttributedString(string: "Unexpected Error", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessage = NSAttributedString(string: "can't delete this team", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedMessage, forKey: "attributedMessage")
        present(alert, animated: true)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            alert.dismiss(animated: true, completion: nil)
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.favoritePresenter?.navigateToTeamDetailsScreen(view: self, teamId: favoriteteamsArray![indexPath.row].teamId, leagueid: favoriteteamsArray![indexPath.row].leagueId, teamName: favoriteteamsArray![indexPath.row].teamName, teamImage: favoriteteamsArray![indexPath.row].teamImage, sportType: favoriteteamsArray![indexPath.row].sportType)
    }
    func  prepareloadingNetworkIndicator(){
        loadingNetworkIndicator.color=UIColor(named: "button")
        loadingNetworkIndicator.center=view.center
        view.addSubview(loadingNetworkIndicator)
        loadingNetworkIndicator.startAnimating()
    }
   
    func addEmptyResultStatusSubview(){
        let labelWidth: CGFloat = self.myTable.bounds.width/2
           let labelHeight: CGFloat = self.myTable.bounds.height/2
           let labelX = (self.myTable.bounds.width - labelWidth) / 2
           let labelY = (self.myTable.bounds.height - labelHeight) / 2
        emptyDataMessage = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight))
        emptyDataMessage!.text = "No data to display"
        emptyDataMessage!.textAlignment = .center
        emptyDataMessage!.textColor=UIColor(named: "text")
        self.myTable.addSubview(emptyDataMessage!)
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
