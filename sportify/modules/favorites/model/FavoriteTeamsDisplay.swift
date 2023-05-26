//
//  FavoriteTeams.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

class FavoriteTeamsDisplay {
    var teamImage:String
    var teamName:String
    var  teamId:Int
    var  leagueId:Int
    init(teamImage: String, teamName: String, teamId: Int, leagueId: Int) {
        self.teamImage = teamImage
        self.teamName = teamName
        self.teamId = teamId
        self.leagueId = leagueId
    }
}
