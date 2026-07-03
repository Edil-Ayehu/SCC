//
//  EventRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 03/07/2026.
//
import Foundation

final class EventRepositoryImpl: EventRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchEvents() async throws -> [EventResponse] {
        
        try await apiClient.request(
            endpoint: Endpoint.Event.list
        )
    }
}
