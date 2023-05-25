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
    var networkDataResponse : [FavoriteTeamsDisplay]!
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
            self?.networkDataResponse = dataToDisplay ?? []
            self?.view.updateView(data: dataToDisplay ?? [])
        }
    }
    func prepareTeamsDataToDisplay(data:[StoredTeam]?)->[FavoriteTeamsDisplay]?{
        if let recivedData = data {
            var dataToDisplay = [FavoriteTeamsDisplay]()
            for team in recivedData {
                dataToDisplay.append(FavoriteTeamsDisplay(teamImage: team.teamImage, teamName: team.teamName))
            }
            return dataToDisplay
        }else {
            return nil
        }
    }
    
    func searchInTeams(with characters: String){
        let filteredArray=self.networkDataResponse.filter { team in
            return team.teamName.contains(characters.replacingOccurrences(of: " ", with: ""))
        }
        self.view.searchInTeamsResults(result: filteredArray)
    }
    func endSearching(){
        self.view.endSearching(result: networkDataResponse)
    }
    
    
}
