//
//  TeamDetailsPresenter.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

class TeamDetailsPresenter:TeamDetailsPresenterProtocol{
    var teamId:Int
    var leagueId:Int
    var view:TeamDetailsViewProtocol
    var networkService:NetworkServiceProtocol
    var dataBaseService:DataBaseServiceProtocol
    init(teamId: Int, leagueId: Int, view: TeamDetailsViewProtocol, networkService: NetworkServiceProtocol,dataBaseService:DataBaseServiceProtocol) {
        self.teamId = teamId
        self.leagueId = leagueId
        self.view = view
        self.networkService = networkService
        self.dataBaseService = dataBaseService
    }
    func getTeamDetails() {
        self.networkService.getTeamDetails(leagueId: leagueId, teamId: teamId) { [weak self] result in
            print("debug team details",result!)
           let teamDetailsToDisplay = self?.prepareTeamDetailsData(data: result)
            self?.view.updateView(data: teamDetailsToDisplay)
        }
    }
    
    func prepareTeamDetailsData(data: [TeamDetailsResult]?) -> TeamDetailsDisplay? {
        if let recivedData = data {
            let teamName = recivedData[0].team_name
            let teamLogo = recivedData[0].team_logo
            print("HEEEEEEEEERRRRRRRRRREEEEEEEE",teamLogo!)
            let teamId = recivedData[0].team_key
            let coachName = recivedData[0].coaches?[0].coach_name
            var playersArray=[TeamPlayerDisplay]()
            if let players = recivedData[0].players {
                for player in players{
                    playersArray.append(TeamPlayerDisplay(age: player.player_age, image: player.player_image, name: player.player_name, number: player.player_number, position: player.player_type))
                }
            }
     let teamDetailsToDisplay = TeamDetailsDisplay(coach_name: coachName, team_name: teamName, team_id: teamId, team_logo: teamLogo, players: playersArray)
            return teamDetailsToDisplay
        }else{
            return nil
        }
    }
    func addTeamToFavorites(teamName:String , teamImage:String){
        dataBaseService.insert(data: StoredTeam(teamId: teamId, leagueId: leagueId, teamName: teamName, teamImage: teamImage)) { [weak self] success in
            if success {
                self?.view.showSuccessInsertAlert()
            }else {
                self?.view.showFailureInsertAlert()
            }
        }
    }
    
    
}
