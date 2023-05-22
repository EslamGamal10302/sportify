//
//  LeaguesViewProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation

protocol LeaguesViewProtocol{
    func updateTable(data : [League])
    func startLoadingAnimation()
    func endLoadingAnimation()
}
