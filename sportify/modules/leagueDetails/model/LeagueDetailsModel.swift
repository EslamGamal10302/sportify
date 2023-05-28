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
    // basketball and crakcet
    let event_home_team_logo:String?
    let event_away_team_logo:String?
    // cricket
    let event_date_start:String?
    // tennis
    let event_first_player:String?
    let event_second_player:String?
    let event_first_player_logo:String?
    let event_second_player_logo:String?
}

struct UpcomingFixtureDisplayedData{
    let FirstTeamImage:String?
    let SecondTeamImage:String?
    let FirstTeamName:String?
    let SecondTeamName:String?
    let MatchDate:String?
    let MatchTime:String?
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

struct LatestResultDisplayedData{
    let FirstTeamImage:String?
    let SecondTeamImage:String?
    let FirstTeamName:String?
    let SecondTeamName:String?
    let matchResult:String?
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



struct TeamDisplayedData{
    let teamId: Int
    let teamName: String?
    let teamLogo: String?
}


enum SportTypeName:String {
    case football = "football"
    case basketbell = "basketball"
    case cricket = "cricket"
    case tennis = "tennis"
}
