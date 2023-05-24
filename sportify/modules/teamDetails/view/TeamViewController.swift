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
    let networkLoadingIndicator=UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingIndicator()
        self.teamDetailsPresentr?.getTeamDetails()
   
    }
    
    func updateView(data: TeamDetailsDisplay?) {
        guard let recivedData = data else {return}
        self.team_name.text=recivedData.team_name
        self.team_coach.text=recivedData.coach_name
        self.team_image.sd_setImage(with: URL(string: recivedData.team_logo ?? ""), placeholderImage: UIImage(named: "empty"))
        guard let players = recivedData.players else {return}
        playersArray=players
        self.networkLoadingIndicator.stopAnimating()
        self.playersCollertionView.reloadData()
    }
    
    
    @IBAction func addToFavorite(_ sender: UIButton) {
        
        
        
    }
    @IBOutlet weak var playersCollertionView: UICollectionView!
    
    
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
    
}
