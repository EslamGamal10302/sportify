//
//  DataBaseServiceProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

protocol DataBaseServiceProtocol{
    func insert(data:StoredTeam , completion : @escaping (Bool)-> Void)
}
