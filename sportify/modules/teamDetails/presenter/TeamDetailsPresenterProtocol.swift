//
//  TeamDetailsPresenterProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation
protocol TeamDetailsPresenterProtocol{
    func getTeamDetails()
    func prepareTeamDetailsData(data:[TeamDetailsResult]?)->TeamDetailsDisplay?
    func addTeamToFavorites(teamName:String , teamImage:String)
}
