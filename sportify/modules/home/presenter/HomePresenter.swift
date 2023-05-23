//
//  HomePresenter.swift
//  sportify
//
//  Created by Eslam gamal on 22/05/2023.
//

import Foundation
import UIKit


class HomePresenter:HomePresenterProtocol {
    var homeScreen : HomeViewProtocol?
    
    init(homeScreen: HomeViewProtocol? = nil) {
        self.homeScreen = homeScreen
    }
    
    func createHomeScreenGamesDetails(){
        var sportsAray = [HomeGames]()
        sportsAray.append(HomeGames(image: UIImage(named: "football")!, title: "Football", key: "football"))
        sportsAray.append(HomeGames(image: UIImage(named: "basket")!, title: "Basketball", key: "basketball"))
        sportsAray.append(HomeGames(image: UIImage(named: "tennis")!, title: "Tennis", key: "tennis"))
        sportsAray.append(HomeGames(image: UIImage(named: "craket")!, title: "Cricket", key: "cricket"))
        self.homeScreen?.showScreenDetails(details: sportsAray)
    }
    
    func navigateToSportLeaguesScreen(sportKey: String, screen: UIViewController) {
        let leaguesView = screen.storyboard?.instantiateViewController(identifier: "leagues") as! LeaguesViewController
        let leaguesPresenter =  LeaguesPresenter(leaguesScreen: leaguesView,networkService: NetworkService.getInstance,sportKey: sportKey)
        leaguesView.leaguesPresenter=leaguesPresenter
        screen.navigationController?.pushViewController(leaguesView, animated: true)
    }
    
    
}
