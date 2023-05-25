//
//  FavoriteTeamsPresenterProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

protocol FavoriteTeamsPresenterProtocol{
    func getAllFavoriteTeams()
    func searchInTeams(with characters: String)
    func endSearching()
}
