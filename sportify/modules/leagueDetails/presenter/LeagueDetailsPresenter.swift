//
//  LeaguesDetailsPresenter.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
class LeagueDetailsPresenter:LeagueDetailsPresenterProtocol{
    
    func getUpcomingFixture() {
        networkService.getLeagueUpcomingFixtures(sportName: sportType, leagueId: leagueId) { [weak self] response in
            self?.view.updateUpcomingFixtures(fixtures: response ?? [])
        }
    }
    
    func getLatestResults() {
        networkService.getLeagueLatestResults(sportName: sportType, leagueId: leagueId) { [weak self] response in
            self?.view.updateLatestResult(results: response ?? [])
        }
    }
    
    func getLeagueTeams() {
        networkService.getLeagueTeams(sportName: sportType, leagueId: leagueId) { [weak self] response in
            self?.view.updateAllTeams(teams: response ?? [])
        }
    }
    
    var sportType:String
    var leagueId:Int
    var view:LeagueDetailsViewProtocol
    var networkService:NetworkServiceProtocol
    init(sportType: String, leagueId: Int, view: LeagueDetailsViewProtocol, networkService: NetworkServiceProtocol) {
        self.sportType = sportType
        self.leagueId = leagueId
        self.view = view
        self.networkService = networkService
    }
    func getScreendata() {
        self.getUpcomingFixture()
        self.getLatestResults()
        self.getLeagueTeams()
    }
   
    
}
