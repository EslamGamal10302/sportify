//
//  DateFormat.swift
//  sportify
//
//  Created by Eslam gamal on 05/06/2023.
//

import Foundation

class DateFormat {
    static func getCurrentDate()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
    static func getDateToPreviousTwoWeeksFromNow()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.day = -15
        let pastDate = calendar.date(byAdding: dateComponent, to: currentDate)
        let formattedPastDate = dateFormatter.string(from: pastDate!)
        return formattedPastDate
    }
    static func getDateToUpcommingTwoWeeksFromNow()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.day = 15
        let futureDate = calendar.date(byAdding: dateComponent, to: currentDate)
        let formattedFutureDate = dateFormatter.string(from: futureDate!)
        return formattedFutureDate
    }
}
