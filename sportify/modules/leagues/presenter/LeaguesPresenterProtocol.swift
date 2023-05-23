//
//  LeaguesPresenterProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation

protocol LeaguesPresenterProtocol{
    func getAllLeaguesDetails()
    func searchInLeagues(with characters:String)
    func endSearching()
}
