//
//  MockNetworkServiceTest.swift
//  sportifyTests
//
//  Created by Eslam gamal on 28/05/2023.
//

import XCTest
@testable import sportify

final class MockNetworkServiceTest: XCTestCase {
    var networkService : NetworkServiceProtocol?
    
    
    func testgetSportAllLeaguesDataShouldPass(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getSportAllLeaguesData(sportName: "football", completion: { response in
            guard let response = response else {
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0,"Error in retrived array")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
        
    }
   
    func testgetSportAllLeaguesDataShouldFail(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getSportAllLeaguesData(sportName: "football", completion: { response in
            XCTAssertNil(response,"items not equal nil")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    
    
    
    
    func testgetLeagueUpcomingFixturesShouldPass(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getLeagueUpcomingFixtures(sportName: "football", leagueId: 150, completion: { response in
            guard let response = response else {
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0,"Error in retrived array")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    
    func testgetLeagueUpcomingFixturesShouldFail(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getLeagueUpcomingFixtures(sportName: "football", leagueId: 180, completion: { response in
            XCTAssertNil(response,"items not equal nil")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
        
    }
    
    
    
    func testgetLeagueLatestResultsShouldPass(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getLeagueLatestResults(sportName: "football", leagueId: 180, completion: { response in
            guard let response = response else {
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0,"Error in retrived array")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    func testgetLeagueLatestResultsShouldFail(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getLeagueLatestResults(sportName: "football", leagueId: 180, completion: { response in
            XCTAssertNil(response,"items not equal nil")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    
   
    
    func testgetLeagueTeamsShouldPass(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getLeagueTeams(sportName: "football", leagueId: 180, completion: { response in
            guard let response = response else {
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0,"Error in retrived array")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    func testgetLeagueTeamsShouldFail(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getLeagueTeams(sportName: "football", leagueId: 180, completion: { response in
            XCTAssertNil(response,"items not equal nil")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    

    
    func testgetTeamDetailsShouldPass(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getTeamDetails(leagueId: 120, teamId: 80, completion: { response in
            guard let response = response else {
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0,"Error in retrived array")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    func testgetTeamDetailsShouldFail(){
        let myExpectation = expectation(description: "wait for my API response")
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getTeamDetails(leagueId: 120, teamId: 80, completion: { response in
            XCTAssertNil(response,"items not equal nil")
            myExpectation.fulfill()
        })
        waitForExpectations(timeout: 10,handler: nil)
    }
    
    
    
    
    
    

}


