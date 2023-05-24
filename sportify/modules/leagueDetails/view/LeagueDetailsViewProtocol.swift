//
//  LeagueDetailsViewProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
protocol LeagueDetailsViewProtocol{
    func updateUpcomingFixtures(fixtures : [UpcomingFixtureDisplayedData])
    func updateLatestResult(results : [LatestResultDisplayedData])
    func updateAllTeams(teams : [TeamDisplayedData])
    
}
