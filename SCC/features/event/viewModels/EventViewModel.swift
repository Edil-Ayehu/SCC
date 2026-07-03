//
//  EventViewModel.swift
//  SCC
//
//  Created by Edil on 03/07/2026.
//

import Foundation

@MainActor
final class EventViewModel: ObservableObject {
    @Published var events: [EventResponse] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String?
    
    private let repository: EventRepository
    
    init(repository: EventRepository) {
        self.repository = repository
    }
    
    func loadEvents() async {
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            events = try await repository.fetchEvents()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
