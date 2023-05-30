//
//  TeamDetails.swift
//  sportify
//
//  Created by Eslam gamal on 24/05/2023.
//

import Foundation
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
