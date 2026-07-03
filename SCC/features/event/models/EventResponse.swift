//
//  EventResponse.swift
//  SCC
//
//  Created by Edil on 03/07/2026.
//

import Foundation

struct EventResponse: Decodable, Identifiable, Hashable {

    let id: String
    let title: String
    let description: String
    let bannerImage: String?
    let startDate: String
    let endDate: String
    let eventType: String
    let address: String?
    let isActive: Bool
    let store: EventStore?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case bannerImage
        case startDate
        case endDate
        case eventType
        case address
        case isActive
        case store
    }
}

struct EventStore: Decodable, Hashable {

    let id: String
    let name: String
    let location: String
    let logo: String?
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case location
        case logo
        case isActive
    }
}
