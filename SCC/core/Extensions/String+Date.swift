//
//  String+Date.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import Foundation

extension String {

    func formattedDateTime() -> String {
        let isoFormatter = ISO8601DateFormatter()

        guard let date = isoFormatter.date(from: self) else {
            return self
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy • h:mm a"

        return formatter.string(from: date)
    }
    
//    func formattedDate(
//        from inputFormatter: ISO8601DateFormatter = ISO8601DateFormatter(),
//        to outputFormat: String = "MMM d, yyyy"
//    ) -> String {
//
//        guard let date = inputFormatter.date(from: self) else {
//            return self
//        }
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = outputFormat
//
//        return formatter.string(from: date)
//    }
    
    func formattedDate(
        from inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        to outputFormat: String = "MMMM dd, yyyy"
    ) -> String {

        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        inputFormatter.dateFormat = inputFormat

        guard let date = inputFormatter.date(from: self) else {
            return self
        }

        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.dateFormat = outputFormat

        return outputFormatter.string(from: date)
    }
}
