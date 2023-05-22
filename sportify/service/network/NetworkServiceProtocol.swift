//
//  NetworkServiceProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
protocol NetworkServiceProtocol {
    func getSportAllLeaguesData(leagueName:String,completion : @escaping ([League]?)-> Void)
}
