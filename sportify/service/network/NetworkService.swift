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
        let url = "https://apiv2.allsportsapi.com/"+sportName+"/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2023-05-23&to=2024-12-30&leagueId=\(leagueId)"
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
        let url = "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2022-01-01&to=2023-05-23&leagueId=\(leagueId)"
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
        let url = "https://apiv2.allsportsapi.com/\(sportName)/?&met=Teams&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&leagueId=\(leagueId)"
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
        let url = "https://apiv2.allsportsapi.com/"+sportName+"/?met=Leagues&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc"
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
    
   

    
}
