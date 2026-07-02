//
//  SignUpResponse.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

struct SignUpResponse: Decodable {
    let phone: String
    let email: String?
    let name: String
    let role: String
    
    enum CodingKeys: String, CodingKey {
        case phone
        case email
        case name
        case role
    }
}
