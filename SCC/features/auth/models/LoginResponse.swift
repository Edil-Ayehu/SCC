//
//  LoginResponse.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//


struct LoginResponse: Decodable {
    let accessToken: String
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case user
    }
}

struct User: Decodable {
    let id: String
    let phone: String
    let email: String?
    let name: String
    let role: String
}
