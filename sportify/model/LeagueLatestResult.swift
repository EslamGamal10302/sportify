//
//  LeagueLatestResult.swift
//  sportify
//
//  Created by Eslam gamal on 30/05/2023.
//

import Foundation
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
    // basketball and cracket
    let event_home_team_logo:String?
    let event_away_team_logo:String?
    // cracket
    let event_home_final_result:String?
    // tennis
    let event_first_player:String?
    let event_second_player:String?
    let event_first_player_logo:String?
    let event_second_player_logo:String?
}
