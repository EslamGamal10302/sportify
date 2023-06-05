//
//  NetworkServiceTest.swift
//  sportifyTests
//
//  Created by Eslam gamal on 26/05/2023.
//

import XCTest
@testable import sportify

final class NetworkServiceTest: XCTestCase {
    let networkService = NetworkService.getInstance
    func testgetSportAllLeaguesData(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService.getSportAllLeaguesData(sportName: "football") { leaguesResponse in
            guard let leagues = leaguesResponse else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(leagues.count, 0,"Error in retrive array")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
    }
    
    func testgetSportAllLeaguesDataShouldFail(){
        let failedExpectation = expectation(description: "Failed API response")
        networkService.getSportAllLeaguesData(sportName: "fotbal") { leaguesResponse in
            XCTAssertNil(leaguesResponse, "leagues response should be nil")
            failedExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        
    }
    
    
    
    
    
    
    
    
    func testgetLeagueUpcomingFixtures(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService.getLeagueUpcomingFixtures(sportName: "football", leagueId: 152) { upcomingResponse in
            guard let upcoming = upcomingResponse else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(upcoming.count, 0,"Error in retrive array")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        }
    
    func testgetLeagueUpcomingFixturesShouldFail(){
        let failedExpectation = expectation(description: "Failed API response")
        networkService.getLeagueUpcomingFixtures(sportName: "fotbal", leagueId: 152) { upcomingResponse in
            XCTAssertNil(upcomingResponse, "Upcoming response should be nil")
            failedExpectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    
    
    
    
    
    
    
    
    func testgetLeagueLatestResults(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService.getLeagueLatestResults(sportName: "football", leagueId: 152) { latestResults in
            guard let results = latestResults else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(results.count, 0,"Error in retrive array")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
    }
    
    func testgetLeagueLatestResultsShouldFail(){
        let failedExpectation = expectation(description: "Failed API response")
        networkService.getLeagueLatestResults(sportName: "fotbal", leagueId: 152) { latestResults in
            XCTAssertNil(latestResults, "latest result should be nil")
            failedExpectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    
    
    
    
    
    func testgetLeagueTeams(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService.getLeagueTeams(sportName: "football", leagueId: 152) { teamsResults in
            guard let teams = teamsResults else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(teams.count, 0,"Error in retrive array")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        
    }
    
    func testgetLeagueTeamsShouldFail(){
        let failedExpectation = expectation(description: "Failed API response")
        networkService.getLeagueTeams(sportName: "fotbll", leagueId: 152) { teamsResults in
            XCTAssertNil(teamsResults, "league Teams should be nil")
            failedExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        
    }
    
    
    
    
    
    
    
    
    func testgetTeamDetails(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService.getTeamDetails(leagueId: 152, teamId: 80) { teamResult in
            guard let team = teamResult else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(team.count, 0,"Error in retrive array")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        
        
       }
    func testgetTeamDetailsShouldFail(){
        let failedExpectation = expectation(description: "Failed API response")
        networkService.getTeamDetails(leagueId: -1, teamId: -1) { teamResult in
            XCTAssertNil(teamResult, "team details should be nil")
            failedExpectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        
    }
    
    
    
    
    
    
    }



