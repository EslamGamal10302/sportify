//
//  StoredTeam.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

struct StoredTeam{
    var teamId:Int
    var leagueId:Int
    var teamName:String
    var teamImage:String
    var sportType:String
    init(teamId: Int, leagueId: Int, teamName: String, teamImage: String,sportType:String) {
        self.teamId = teamId
        self.leagueId = leagueId
        self.teamName = teamName
        self.teamImage = teamImage
        self.sportType = sportType
    }
    init(){
        self.teamId = 0
        self.leagueId = 0
        self.teamName = ""
        self.teamImage = ""
        self.sportType = ""
    }
}
