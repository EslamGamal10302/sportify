//
//  NetworkConnection.swift
//  sportify
//
//  Created by Eslam gamal on 30/05/2023.
//

import Foundation
import Reachability
class NetworkConnection{
    static let getInstance = NetworkConnection()
    let reachability : Reachability = try! Reachability()
   private init() {
        print("singleton object reachability  created")
    }
}
