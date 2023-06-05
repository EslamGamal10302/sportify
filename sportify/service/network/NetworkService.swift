//
//  NetworkService.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
import Alamofire

class NetworkService:NetworkServiceProtocol {
    static let getInstance = NetworkService()
   private init() {
        print("singleton object created")
    }
    func getLeagueUpcomingFixtures(sportName: String, leagueId: Int, completion: @escaping ([Upcoming]?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/"+sportName+"/?met=Fixtures&APIkey=c0bddea4fa8a6125d9d6a00001e9ecd71e7107a99aeef4d1154c551d2feb96e8&from=2023-05-23&to=2024-12-30&leagueId=\(leagueId)"
        AF.request(url).responseDecodable(of: LeagueUpcoming.self) { response in
            switch response.result {
            case .success(let value):
                print("upcomingfixture here")
                let data = value.result
                print("upcoming",data ?? [])
                completion(data)
            case .failure(let error):
                print(error)
                print("error loading upcoming fixtures")
                completion(nil)
            }
        }
        
        
        
        
        
    }
    
    func getLeagueLatestResults(sportName: String, leagueId: Int, completion: @escaping ([LatestResult]?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&APIkey=c0bddea4fa8a6125d9d6a00001e9ecd71e7107a99aeef4d1154c551d2feb96e8&from=2022-01-01&to=2023-05-23&leagueId=\(leagueId)"
        AF.request(url).responseDecodable(of: LeagueLatestResult.self) { response in
            switch response.result {
            case .success(let value):
                let data = value.result
                print("latest result recived")
                print("latest",data ?? [])
                completion(data)
            case .failure(let error):
                print(error)
                print("error loading latest result")
                completion(nil)
            }
        }
        
        
        
    }
    
    func getLeagueTeams(sportName: String, leagueId: Int, completion: @escaping ([Team]?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/\(sportName)/?&met=Teams&APIkey=c0bddea4fa8a6125d9d6a00001e9ecd71e7107a99aeef4d1154c551d2feb96e8&leagueId=\(leagueId)"
        AF.request(url).responseDecodable(of: LeagueTeams.self) { response in
            switch response.result {
            case .success(let value):
                print("all teams here")
                let data = value.result
                print("teams",data ?? [])
                completion(data)
            case .failure(let error):
                print(error)
                print("error loading teams")
                completion(nil)
            }
        }
        
        
        
        
    }
    
  
    func getSportAllLeaguesData(sportName:String,completion: @escaping ([League]?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/"+sportName+"/?met=Leagues&APIkey=c0bddea4fa8a6125d9d6a00001e9ecd71e7107a99aeef4d1154c551d2feb96e8"
        AF.request(url).responseDecodable(of:ApiResponse.self){response in
            switch response.result {
                 case .success(let value):
                print("success")
                 let data = value.result
                 completion(data)
                 case .failure(let error):
                     print(error)
                completion(nil)
        
                 }
        }
    }
    func getTeamDetails(leagueId: Int, teamId: Int, completion: @escaping ([TeamDetailsResult]?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=c0bddea4fa8a6125d9d6a00001e9ecd71e7107a99aeef4d1154c551d2feb96e8&leagueId=\(leagueId)&teamId=\(teamId)"
        AF.request(url).responseDecodable(of:TeamDetails.self){response in
            switch response.result {
                 case .success(let value):
                print("team details arrive")
                 let data = value.result
                print(data ?? [])
                 completion(data)
                 case .failure(let error):
                print("error team details failure")
                     print(error)
                     completion(nil)
        
                 }
        }
    }

    
}
