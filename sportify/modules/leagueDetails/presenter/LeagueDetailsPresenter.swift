//
//  LeaguesDetailsPresenter.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
import UIKit
class LeagueDetailsPresenter:LeagueDetailsPresenterProtocol{
    
    var sportType:String
    var leagueId:Int
    var view:LeagueDetailsViewProtocol
    var networkService:NetworkServiceProtocol
    
    init(sportType: String, leagueId: Int, view: LeagueDetailsViewProtocol, networkService: NetworkServiceProtocol) {
        self.sportType = sportType
        self.leagueId = leagueId
        self.view = view
        self.networkService = networkService
        print(sportType)
        print(leagueId)
    }
    
    func getUpcomingFixture() {
        networkService.getLeagueUpcomingFixtures(sportName: sportType, leagueId: leagueId) { [weak self] response in
            let upcomingData = self?.prepareUpcomingFixtureData(data: response)
            self?.view.updateUpcomingFixtures(fixtures: upcomingData ?? [])
        }
    }
    
    func getLatestResults() {
        networkService.getLeagueLatestResults(sportName: sportType, leagueId: leagueId) { [weak self] response in
            let resultData = self?.prepareLatestGamesData(data: response)
            self?.view.updateLatestResult(results: resultData ?? [])
        }
    }
    
    func getLeagueTeams() {
        networkService.getLeagueTeams(sportName: sportType, leagueId: leagueId) { [weak self] response in
            let teamsResult = self?.prepareTeamsData(data: response)
            self?.view.updateAllTeams(teams: teamsResult ?? [])
        }
    }
    
  
    func getScreendata() {
        self.getUpcomingFixture()
        self.getLatestResults()
        self.getLeagueTeams()
    }
    
    func prepareLatestGamesData(data: [LatestResult]?) -> [LatestResultDisplayedData]? {
        if let recivedData = data {
            var dataArray=[LatestResultDisplayedData]()
            for match in recivedData {
                switch(sportType) {
                case SportTypeName.football.rawValue :
                    dataArray.append(LatestResultDisplayedData(FirstTeamImage: match.home_team_logo, SecondTeamImage: match.away_team_logo, FirstTeamName: match.event_home_team, SecondTeamName: match.event_away_team, matchResult: match.event_final_result))
                case SportTypeName.basketbell.rawValue :
                    dataArray.append(LatestResultDisplayedData(FirstTeamImage: match.event_home_team_logo, SecondTeamImage: match.event_away_team_logo, FirstTeamName: match.event_home_team, SecondTeamName: match.event_away_team, matchResult: match.event_final_result))
                case SportTypeName.cricket.rawValue :
                    dataArray.append(LatestResultDisplayedData(FirstTeamImage: match.event_home_team_logo, SecondTeamImage: match.event_away_team_logo, FirstTeamName: match.event_home_team, SecondTeamName: match.event_away_team, matchResult: match.event_home_final_result))
                default :
                    dataArray.append(LatestResultDisplayedData(FirstTeamImage: match.event_first_player_logo, SecondTeamImage: match.event_second_player_logo, FirstTeamName: match.event_first_player, SecondTeamName: match.event_second_player, matchResult: match.event_final_result))
                }
            }
            return dataArray
        }else {
            return nil
        }
    }
    
    func prepareTeamsData(data: [Team]?) -> [TeamDisplayedData]? {
        if let recivedData = data {
            var dataArray = [TeamDisplayedData]()
            for team in recivedData {
                dataArray.append(TeamDisplayedData(teamId: team.team_key, teamName: team.team_name, teamLogo: team.team_logo))
            }
            return dataArray
        }else {
            return nil
        }
    }
    
    func prepareUpcomingFixtureData(data:[Upcoming]?) -> [UpcomingFixtureDisplayedData]? {
        if let recivedData = data {
            var dataArray=[UpcomingFixtureDisplayedData]()
            for match in recivedData {
                switch(sportType) {
                case SportTypeName.football.rawValue :
                    dataArray.append(UpcomingFixtureDisplayedData(FirstTeamImage: match.home_team_logo, SecondTeamImage: match.away_team_logo, FirstTeamName: match.event_home_team, SecondTeamName: match.event_away_team, MatchDate: match.event_date, MatchTime: match.event_time))
                case SportTypeName.basketbell.rawValue :
                    dataArray.append(UpcomingFixtureDisplayedData(FirstTeamImage: match.event_home_team_logo, SecondTeamImage: match.event_away_team_logo, FirstTeamName: match.event_home_team, SecondTeamName: match.event_away_team, MatchDate: match.event_date, MatchTime: match.event_time))
                case SportTypeName.cricket.rawValue :
                    dataArray.append(UpcomingFixtureDisplayedData(FirstTeamImage: match.event_home_team_logo, SecondTeamImage: match.event_away_team_logo, FirstTeamName: match.event_home_team, SecondTeamName: match.event_away_team, MatchDate: match.event_date_start, MatchTime: match.event_time))
                default :
                    dataArray.append(UpcomingFixtureDisplayedData(FirstTeamImage: match.event_first_player_logo, SecondTeamImage: match.event_second_player_logo, FirstTeamName: match.event_first_player, SecondTeamName: match.event_second_player, MatchDate: match.event_date, MatchTime: match.event_time))
                }
            }
            return dataArray
        }else {
            return nil
        }
    }
    
   
    
    func getSportType() -> String {
        return sportType
    }
    func navigateToTeamDetailsScreen(teamId: Int, view: UIViewController) {
        if sportType == "football" {
       // navigation here
            print("will navigate",teamId)
            print(teamId,leagueId)
            let teamDetailsScreen = view.storyboard?.instantiateViewController(identifier: "teamDetails") as!TeamViewController
            let  teamDetailsPresenter = TeamDetailsPresenter(teamId: teamId, leagueId: leagueId, view: teamDetailsScreen, networkService: NetworkService.getInstance)
            teamDetailsScreen.teamDetailsPresentr = teamDetailsPresenter
            view.navigationController?.pushViewController(teamDetailsScreen, animated: true)
        }else{
            self.view.showNavigationAlertError()
            print("alert will apear")
        }
    }
    
}
