//
//  ResetPasswordRequest.swift
//  SCC
//
//  Created by Edil on 13/07/2026.
//

struct ResetPasswordRequest: Encodable {
    let phone: String
    let code: String
    let newPassword: String
}
