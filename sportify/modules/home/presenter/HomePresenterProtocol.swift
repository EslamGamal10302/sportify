//
//  HomePresenterProtocol.swift
//  sportify
//
//  Created by Eslam gamal on 22/05/2023.
//

import Foundation
import UIKit

protocol HomePresenterProtocol {
    func createHomeScreenGamesDetails()
    func navigateToSportLeaguesScreen(sportKey:String,screen:UIViewController)
}
