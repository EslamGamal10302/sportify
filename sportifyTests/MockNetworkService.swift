//
//  MocNetworkService.swift
//  sportifyTests
//
//  Created by Eslam gamal on 28/05/2023.
//

import Foundation
@testable import sportify

class MockNetworkService {
    var shouldReturnError:Bool
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    let mockItemsJSONResponse = ApiJsonResponse.upcomingFixtureResponse
    
    enum ResponseWithError : Error {
        case responseError
    }
}

extension MockNetworkService:NetworkServiceProtocol {
    
    func getSportAllLeaguesData(sportName: String, completion: @escaping ([sportify.League]?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            do{
                let result = try JSONDecoder().decode(ApiResponse.self, from: ApiJsonResponse.sportAllLeaguesResponse.data(using: .utf8)!)
                completion(result.result)
            }catch {
              completion(nil)
            }
        }
    }
    
    
    
    
    func getLeagueUpcomingFixtures(sportName: String, leagueId: Int, completion: @escaping ([sportify.Upcoming]?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            do{
                let result = try JSONDecoder().decode(LeagueUpcoming.self, from: ApiJsonResponse.upcomingFixtureResponse.data(using: .utf8)!)
                completion(result.result)
            }catch {
              completion(nil)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    func getLeagueLatestResults(sportName: String, leagueId: Int, completion: @escaping ([sportify.LatestResult]?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            do{
                let result = try JSONDecoder().decode(LeagueLatestResult.self, from: ApiJsonResponse.latestResultResponse.data(using: .utf8)!)
                completion(result.result)
            }catch {
              completion(nil)
            }
        }
    }
    
    
    func getLeagueTeams(sportName: String, leagueId: Int, completion: @escaping ([sportify.Team]?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            do{
                let result = try JSONDecoder().decode(LeagueTeams.self, from: ApiJsonResponse.leagueTeamsResponse.data(using: .utf8)!)
                completion(result.result)
            }catch {
              completion(nil)
            }
        }
    }
    

   
    
    func getTeamDetails(leagueId: Int, teamId: Int, completion: @escaping ([sportify.TeamDetailsResult]?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            do{
                let result = try JSONDecoder().decode(TeamDetails.self, from: ApiJsonResponse.teamDetailsResponse.data(using: .utf8)!)
                completion(result.result)
            }catch {
              completion(nil)
            }
        }
    }
    
    
}
