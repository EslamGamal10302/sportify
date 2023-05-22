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
        sportsAray.append(HomeGames(image: UIImage(named: "football")!, title: "Football"))
        sportsAray.append(HomeGames(image: UIImage(named: "basket")!, title: "Basketball"))
        sportsAray.append(HomeGames(image: UIImage(named: "tennis")!, title: "Tennis"))
        sportsAray.append(HomeGames(image: UIImage(named: "craket")!, title: "Cricket"))
        self.homeScreen?.showScreenDetails(details: sportsAray)
    }
    
    
    
}
