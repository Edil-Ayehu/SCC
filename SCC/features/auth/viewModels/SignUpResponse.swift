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
    
//    let isActive: Bool
//    let storeId: String?
//    
//    let creditLimit: Double
//    let creditBalance: Double
//    
//    let id: String
//    let createdAt: Date
//    let updatedAt: Date
    
//    let version: Int
    
    enum CodingKeys: String, CodingKey {
        case phone
        case email
        case name
        case role
        
//        case isActive
//        case storeId
//        
//        case creditLimit
//        case creditBalance
//        
//        case id
//        
//        case createdAt
//        case updatedAt
        
//        case version = "__v"
    }
}
