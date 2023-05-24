//
//  LeagueDetailsModel.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation

struct LeagueUpcoming: Codable {
    let success: Int
    let result: [Upcoming]?
}
struct Upcoming:Codable {
    let home_team_logo:String?
    let away_team_logo:String?
    let event_home_team:String?
    let event_away_team:String?
    let event_date:String?
    let event_time:String?
    let league_round:String?
    let league_season:String?
    // basketball
    let event_home_team_logo:String?
    let event_away_team_logo:String?
}



struct LeagueLatestResult: Codable {
    let success: Int
    let result: [LatestResult]?
}
struct LatestResult:Codable {
    let home_team_logo:String?
    let away_team_logo:String?
    let event_home_team:String?
    let event_away_team:String?
    let event_date:String?
    let event_time:String?
    let league_round:String?
    let league_season:String?
    let event_final_result:String?
    // basketball
    let event_home_team_logo:String?
    let event_away_team_logo:String?
}



struct LeagueTeams: Codable {
    let success: Int
    let result: [Team]?
}


struct Team: Codable {
    let team_key: Int
    let team_name: String?
    let team_logo: String?

}
