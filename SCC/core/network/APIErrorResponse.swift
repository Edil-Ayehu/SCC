//
//  APIErrorResponse.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

struct APIErrorResponse: Decodable {
    let statusCode: Int
    let message: [String]
    let error: String
}
