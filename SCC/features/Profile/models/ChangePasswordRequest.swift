//
//  ChangePasswordRequest.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//


import Foundation

struct ChangePasswordRequest: Encodable {

    let oldPassword: String
    let newPassword: String
}
