//
//  HomeViewController.swift
//  sportify
//
//  Created by Eslam gamal on 20/05/2023.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,HomeViewProtocol {
   
    
    var sportsAray:[HomeGames]?
    var homeProtocol : HomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Dead Load")
        sportsAray = [HomeGames]()
        homeProtocol = HomePresenter(homeScreen: self)
        homeProtocol?.createHomeScreenGamesDetails()
    }
    
    
    func showScreenDetails(details: [HomeGames]) {
       sportsAray = details
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("will appear")
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = false
    }

  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
     
        print("here")
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        print("here")
        return sportsAray?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
         as! HomeCollectionViewCell
         print("here")
        cell.homeLabel.text=sportsAray?[indexPath.row].title
        cell.homeImage.image=sportsAray?[indexPath.row].image
        cell.layer.cornerRadius = 20
         cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width*0.45), height: (collectionView.bounds.width*0.85))
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
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch(indexPath.row){
        case 0 :
            print("football")
            let leaguesView = self.storyboard?.instantiateViewController(identifier: "leagues") as! LeaguesViewController
            self.navigationController?.pushViewController(leaguesView, animated: true)
        case 1:
            print("basket")
        case 2 :
            print("tennis")
        default :
            print("cracket")
        }
    }


}
