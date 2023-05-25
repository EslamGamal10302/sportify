//
//  DataBaseServiceProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

protocol DataBaseServiceProtocol{
    func insertTeam(data:StoredTeam , completion : @escaping (Bool)-> Void)
    func getAllTeams(completion : @escaping ([StoredTeam]?)-> Void)
    func deleteTeam(teamId:Int , completion : @escaping (Bool)-> Void)
}
