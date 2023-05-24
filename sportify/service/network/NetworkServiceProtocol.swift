//
//  NetworkServiceProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
protocol NetworkServiceProtocol {
    func getSportAllLeaguesData(sportName:String,completion : @escaping ([League]?)-> Void)
    func getLeagueUpcomingFixtures(sportName:String,leagueId:Int,completion : @escaping ([Upcoming]?)-> Void)
    func getLeagueLatestResults(sportName:String,leagueId:Int,completion : @escaping ([LatestResult]?)-> Void)
    func getLeagueTeams(sportName:String,leagueId:Int,completion : @escaping ([Team]?)-> Void)
    func getTeamDetails(leagueId:Int,teamId:Int,completion :@escaping ([TeamDetailsResult]?)-> Void)
}
