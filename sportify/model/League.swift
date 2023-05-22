//
//  League.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation

struct ApiResponse :Codable {
    let success : Int
    let result :[League]
}
struct League : Codable {
    let league_key : Int?
    let league_name : String?
    let league_logo : String?
}
