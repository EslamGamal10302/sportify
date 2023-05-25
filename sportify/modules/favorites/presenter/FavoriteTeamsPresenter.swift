//
//  FavoriteTeamsPresenter.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

class FavoriteTeamsPresenter:FavoriteTeamsPresenterProtocol{
    var view:FavoriteViewProtocol
    var dataBaseService:DataBaseServiceProtocol
    var databaseResponse : [FavoriteTeamsDisplay]!
    init(view: FavoriteViewProtocol, dataBaseService: DataBaseServiceProtocol) {
        self.view = view
        self.dataBaseService = dataBaseService
    }
    func getAllFavoriteTeams() {
        dataBaseService.getAllTeams { [weak self] teams in
            print("data recived in presenter")
       //     print(teams!)
            let dataToDisplay = self?.prepareTeamsDataToDisplay(data: teams)
        print("bfore send to view")
            print(dataToDisplay!)
            self?.databaseResponse = dataToDisplay ?? []
            self?.view.updateView(data: dataToDisplay ?? [])
        }
    }
    func prepareTeamsDataToDisplay(data:[StoredTeam]?)->[FavoriteTeamsDisplay]?{
        if let recivedData = data {
            var dataToDisplay = [FavoriteTeamsDisplay]()
            for team in recivedData {
                dataToDisplay.append(FavoriteTeamsDisplay(teamImage: team.teamImage, teamName: team.teamName,teamId: team.teamId))
            }
            return dataToDisplay
        }else {
            return nil
        }
    }
    
    func searchInTeams(with characters: String){
        let filteredArray=self.databaseResponse.filter { team in
            return team.teamName.contains(characters.replacingOccurrences(of: " ", with: ""))
        }
        self.view.searchInTeamsResults(result: filteredArray)
    }
    func endSearching(){
        self.view.endSearching(result: databaseResponse)
    }
    
    func deleteTeam(itemIndexPath:IndexPath,teamId:Int){
        self.dataBaseService.deleteTeam(teamId: teamId) { [weak self] success in
            if success {
                self?.view.showDeleteSuccessalert()
                self?.view.updateViewAfterDeleteItem(itemIndexPath: itemIndexPath)
            } else {
                self?.view.showDeleteErrorAlert()
            }
        }
    }
    
    
}
