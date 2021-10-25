//
//  String+Extension.swift
//  PlayMaker
//
//  Created by Артем Фролов on 08.07.2021.
//

import Foundation

extension String {
        
    var monthDayYear: String {
        convertFormat(fromFormat: dateFormat, toFormat: newsDateFormat)
    }
    
    private var dateFormat: String {
        "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    
    private var newsDateFormat: String {
        "MMM dd, yyyy"
    }
    
    private func convertFormat(fromFormat: String, toFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = Date.timeZoneUTC
        formatter.dateFormat = fromFormat
        guard let dateOrigin = formatter.date(from: self) else { return "" }
        formatter.dateFormat = toFormat
        formatter.locale = Locale.current
        return formatter.string(from: dateOrigin)
    }
    
    func utcToLocal() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
