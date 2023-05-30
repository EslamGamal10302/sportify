//
//  LeagueTeams.swift
//  sportify
//
//  Created by Eslam gamal on 30/05/2023.
//

import Foundation
struct LeagueTeams: Codable {
    let success: Int
    let result: [Team]?
}


struct Team: Codable {
    let team_key: Int
    let team_name: String?
    let team_logo: String?

}
