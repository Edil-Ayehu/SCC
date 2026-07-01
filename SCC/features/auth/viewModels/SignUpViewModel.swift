//
//  SignUpViewModel.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
