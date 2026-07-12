//
//  Initials.swift
//  SCC
//
//  Created by Edil on 12/07/2026.
//

import Foundation

extension String {
    var initials: String {
        let words = self
            .split(separator: " ")
            .prefix(2)

        return words
            .compactMap { $0.first }
            .map(String.init)
            .joined()
            .uppercased()
    }
}
