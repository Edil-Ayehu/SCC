//
//  EventRepository.swift
//  SCC
//
//  Created by Edil on 03/07/2026.
//

protocol EventRepository {
    func fetchEvents() async throws -> [EventResponse]
}

