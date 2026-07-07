//
//  Voucher.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//
import Foundation

struct Voucher: Identifiable {
    let id = UUID()
    let code: String
    let productCount: Int
    let isRedeemed: Bool
}
