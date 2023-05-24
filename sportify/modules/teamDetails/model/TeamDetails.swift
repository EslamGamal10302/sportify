//
//  TeamDetails.swift
//  sportify
//
//  Created by Eslam gamal on 24/05/2023.
//

import Foundation

struct TeamDetails: Codable {
    let success: Int?
    let result: [TeamDetailsResult]?
}

struct TeamDetailsResult :Codable {
    let team_key:Int?
    let team_name:String?
    let team_logo:String?
    let players:[Player]?
    let coaches:[Coach]?
    

}
struct Player:Codable {
    let player_age:String?
    let player_image:String?
    let player_name:String?
    let player_number:String?
    let player_type:String?
}
struct Coach:Codable{
    let coach_name:String?
}








struct TeamDetailsDisplay{
    let coach_name:String?
    let team_name:String?
    let team_id:Int?
    let team_logo:String?
    let players :[TeamPlayerDisplay]?
}
struct TeamPlayerDisplay {
    let age:String?
    let image:String?
    let name:String?
    let number:String?
    let position:String?
}
