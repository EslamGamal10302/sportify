//
//  LeagueDetailsViewProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
protocol LeagueDetailsViewProtocol{
    func updateUpcomingFixtures(fixtures : [Upcoming])
    func updateLatestResult(results : [LatestResult])
    func updateAllTeams(teams : [Team])
    
}
