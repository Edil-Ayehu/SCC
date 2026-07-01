//
//  SignUpRequest.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

struct SignUpRequest: Encodable {
    let phone: String
    let email: String?
    let password: String
    let name: String
    let role: UserRole = .customer
}
