//
//  LeaguesDetailsPresenterProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation

protocol LeagueDetailsPresenterProtocol{
    func getScreendata()
    func getUpcomingFixture()
    func getLatestResults()
    func getLeagueTeams()
    func getSportType()->String  // must deleted
    func prepareUpcomingFixtureData(data:[Upcoming]?)->[UpcomingFixtureDisplayedData]?
    func prepareLatestGamesData(data:[LatestResult]?)->[LatestResultDisplayedData]?
    func prepareTeamsData(data:[Team]?)->[TeamDisplayedData]?
    
}
