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
    
    func formattedDate(
        from inputFormatter: ISO8601DateFormatter = ISO8601DateFormatter(),
        to outputFormat: String = "MMM d, yyyy"
    ) -> String {

        guard let date = inputFormatter.date(from: self) else {
            return self
        }

        let formatter = DateFormatter()
        formatter.dateFormat = outputFormat

        return formatter.string(from: date)
    }
}
