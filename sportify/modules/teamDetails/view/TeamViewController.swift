//
//  TeamViewController.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit
import SDWebImage

class TeamViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TeamDetailsViewProtocol {
   
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBOutlet weak var team_image: UIImageView!
    @IBOutlet weak var team_name: UILabel!
    @IBOutlet weak var team_coach: UILabel!
    var teamDetailsPresentr : TeamDetailsPresenterProtocol?
    var playersArray = [TeamPlayerDisplay]()
    var teamName:String?
    var teamImageUrl:String?
    let networkLoadingIndicator=UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingIndicator()
        self.teamDetailsPresentr?.getTeamDetails()
   
    }
    
    func updateView(data: TeamDetailsDisplay?) {
        guard let recivedData = data else {return}
        self.team_name.text=recivedData.team_name
        self.teamName=recivedData.team_name
        self.team_coach.text=recivedData.coach_name
        self.team_image.sd_setImage(with: URL(string: recivedData.team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
        self.teamImageUrl=recivedData.team_logo
        guard let players = recivedData.players else {return}
        playersArray=players
        self.networkLoadingIndicator.stopAnimating()
        self.playersCollertionView.reloadData()
    }
    func updateSpecialTeamData(teamImage: String, teamName: String) {
        self.team_name.text=teamName
        self.teamName=teamName
        self.team_image.sd_setImage(with: URL(string: teamImage), placeholderImage: UIImage(named: "empty"))
        self.teamImageUrl=teamImage
        self.team_coach.text="Not Available"
        self.networkLoadingIndicator.stopAnimating()
        addEmptyResultStatusSubview()
    }
    
    
    @IBAction func addToFavorite(_ sender: UIButton) {
        self.teamDetailsPresentr?.addTeamToFavorites(teamName: teamName ?? "" , teamImage: teamImageUrl ?? "")
        
    }
    @IBOutlet weak var playersCollertionView: UICollectionView!
    
    
    @IBOutlet weak var favorite: UIButton!
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlayerCollectionViewCell
        cell.playerPosition.text = playersArray[indexPath.row].position
        cell.player_age.text = playersArray[indexPath.row].age
        cell.player_name.text=playersArray[indexPath.row].name
        cell.player_number.text = playersArray[indexPath.row].number
        cell.player_image.sd_setImage(with: URL(string: playersArray[indexPath.row].image ?? ""), placeholderImage: UIImage(named: "empty"))
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
    
    func setupLoadingIndicator(){
        networkLoadingIndicator.color=UIColor(named: "button")
        networkLoadingIndicator.center=CGPoint(x: self.playersCollertionView.bounds.width/2, y: self.playersCollertionView.bounds.height/2)
        playersCollertionView.addSubview(networkLoadingIndicator)
        networkLoadingIndicator.startAnimating()
    }
    func showSuccessInsertAlert() {
     self.favorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
     startFavoriteButtonAnimation()
    }
    func showFailureInsertAlert() {
        let alert = UIAlertController(title: "Unexpected Error", message: "Team is already exist in your favorite list you can't insert it again", preferredStyle: .alert)
           alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "launch")
        let attributedTitle = NSAttributedString(string: "Unexpected Error", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessage = NSAttributedString(string: "Team is already exist in your favorite list you can't insert it again", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedMessage, forKey: "attributedMessage")
           present(alert, animated: true)
           Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
               alert.dismiss(animated: true, completion: nil)
           }
    }
    func  startFavoriteButtonAnimation(){
        let initialSize = CGFloat(17)
         let expandedSize = CGFloat(35)
        UIView.animate(withDuration: 0.5, animations: {
             let originalImage = self.favorite.image(for: .normal)
             let expandedImage = originalImage?.withConfiguration(UIImage.SymbolConfiguration(pointSize: expandedSize))
             self.favorite.setImage(expandedImage, for: .normal)
             self.favorite.layoutIfNeeded()
         }) { _ in
             UIView.animate(withDuration: 0.5, animations: {
                 let originalImage = self.favorite.image(for: .normal)
                 let resizedImage = originalImage?.withConfiguration(UIImage.SymbolConfiguration(pointSize: initialSize))
                 self.favorite.setImage(resizedImage, for: .normal)
                 self.favorite.layoutIfNeeded()
             }) { _ in
                 self.showAlert()
             }
         }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Added successfully", message: "Team added successfully to your favorite list you can display it any time", preferredStyle: .alert)
           alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "launch")
        let attributedTitle = NSAttributedString(string: "Added successfully", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessage = NSAttributedString(string: "Team added successfully to your favorite list you can display it any time", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text")!])
           alert.setValue(attributedMessage, forKey: "attributedMessage")
           present(alert, animated: true)
           Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
               alert.dismiss(animated: true, completion: nil)
           }
    }
    
    func addEmptyResultStatusSubview(){
        let labelWidth: CGFloat = self.playersCollertionView.bounds.width/2
        let labelHeight: CGFloat = self.playersCollertionView.bounds.height/2
        let labelX = (self.playersCollertionView.bounds.width - labelWidth) / 2
        let labelY = (self.playersCollertionView.bounds.height - labelHeight) / 4
        let msg = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight))
        msg.text = "No data to display"
        msg.textAlignment = .center
        msg.textColor=UIColor(named: "text")
        self.playersCollertionView.addSubview(msg)
    }
    
    
    
    
}
