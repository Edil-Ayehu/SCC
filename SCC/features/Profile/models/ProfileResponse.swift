//
//  ProfileResponse.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

import Foundation

struct ProfileResponse: Decodable, Identifiable {

    let id: String
    let name: String
    let email: String?
    let phone: String
    let role: String
    let isActive: Bool
    let updatedAt: String
}
