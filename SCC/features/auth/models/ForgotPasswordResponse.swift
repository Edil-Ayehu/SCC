//
//  ForgotPasswordResponse.swift
//  SCC
//
//  Created by Edil on 13/07/2026.
//
import SwiftUI

struct ForgotPasswordResponse: Decodable {
    let message: String
    let phone: String
    let developmentOtpCode: String?
}
