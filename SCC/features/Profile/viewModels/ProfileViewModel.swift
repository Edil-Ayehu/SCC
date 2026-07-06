//
//  ProfileViewModel.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//
import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var profile: ProfileResponse?
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    private let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    
    func loadProfile() async {
        isLoading = true
        
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            
            profile = try await repository.getProfile()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}
