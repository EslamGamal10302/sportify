//
//  LeaguesPresenter.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
import UIKit

class LeaguesPresenter:LeaguesPresenterProtocol {
    
    
    var leaguesScreen:LeaguesViewProtocol?
    var networkService:NetworkServiceProtocol?
    var networkDataResponse : [League]!
    var sportKey:String?
    init(leaguesScreen: LeaguesViewProtocol? = nil, networkService: NetworkServiceProtocol? = nil,sportKey:String) {
        self.leaguesScreen = leaguesScreen
        self.networkService = networkService
        self.sportKey=sportKey
    }
    
    func getAllLeaguesDetails() {
       print(sportKey!)
        self.leaguesScreen?.startLoadingAnimation()
        self.networkService?.getSportAllLeaguesData(sportName: sportKey!, completion: { [weak self] leaguesResponse in
            self?.leaguesScreen?.endLoadingAnimation()
            self?.networkDataResponse=leaguesResponse
            self?.leaguesScreen!.updateTable(data: leaguesResponse ?? [League]())
        })
    }
    
    func searchInLeagues(with characters: String) {
        let filteredArray=self.networkDataResponse.filter { league in
            return league.league_name!.contains(characters.replacingOccurrences(of: " ", with: ""))
        }
        leaguesScreen?.searchInLeaguesResults(result: filteredArray)
    }
    
    func endSearching() {
        leaguesScreen?.endSearching(result: networkDataResponse)
    }
    func navigateToLeagueDetailsScreen(leagueID: Int, view: UIViewController) {
        let leagueDetailsView = view.storyboard?.instantiateViewController(identifier: "leaguesDetails")
        as! LeagueDetailsViewController
        let leagueDetailsPresenter = LeagueDetailsPresenter(sportType: sportKey!, leagueId: leagueID, view: leagueDetailsView, networkService: NetworkService.getInstance)
        leagueDetailsView.leagueDetailPresenter = leagueDetailsPresenter
        view.navigationController?.pushViewController(leagueDetailsView, animated: true)
    }

    
}
