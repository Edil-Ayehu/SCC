//
//  LogoutViewModel.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import Foundation

@MainActor
final class LogoutViewModel: ObservableObject {

    @Published var isLoggingOut = false
    @Published var didLogout = false
    @Published var errorMessage: String?

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func logout() async {

        isLoggingOut = true
        errorMessage = nil

        defer {
            isLoggingOut = false
        }

        do {

            try await repository.logout()

            didLogout = true

        } catch {

            errorMessage = error.localizedDescription
        }
    }
}
