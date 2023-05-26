//
//  FavoriteTeamsPresenterProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation
import UIKit
protocol FavoriteTeamsPresenterProtocol{
    func getAllFavoriteTeams()
    func searchInTeams(with characters: String)
    func endSearching()
    func deleteTeam(itemIndexPath:IndexPath,teamId:Int)
    func navigateToTeamDetailsScreen(view:UIViewController,teamId:Int,leagueid:Int,teamName:String,teamImage:String,sportType:String)
}
