//
//  FavoriteViewProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation

protocol FavoriteViewProtocol{
    func updateView(data:[FavoriteTeamsDisplay])
    func searchInTeamsResults(result: [FavoriteTeamsDisplay])
    func endSearching(result: [FavoriteTeamsDisplay])
    
}
