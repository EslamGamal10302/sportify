//
//  TeamDetailsViewProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation
protocol TeamDetailsViewProtocol{
    func updateView(data : TeamDetailsDisplay?)
    func updateSpecialTeamData(teamImage:String,teamName:String)
    func showSuccessInsertAlert()
    func showFailureInsertAlert()
    
}
