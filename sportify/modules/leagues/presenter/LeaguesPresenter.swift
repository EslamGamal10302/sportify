//
//  LeaguesPresenter.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation

class LeaguesPresenter:LeaguesPresenterProtocol {
    
    var leaguesScreen:LeaguesViewProtocol?
    var networkService:NetworkServiceProtocol?
    init(leaguesScreen: LeaguesViewProtocol? = nil, networkService: NetworkServiceProtocol? = nil) {
        self.leaguesScreen = leaguesScreen
        self.networkService = networkService
    }
    
    func getAllLeaguesDetails(leagueName:String) {
        self.leaguesScreen?.startLoadingAnimation()
        self.networkService?.getSportAllLeaguesData(leagueName: leagueName, completion: { [weak self] leaguesResponse in
            self?.leaguesScreen?.endLoadingAnimation()
            self?.leaguesScreen!.updateTable(data: leaguesResponse ?? [League]())
        })
    }

    
}
