//
//  VoucherStatus.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//

import Foundation

enum VoucherStatus: String, Decodable {
    case pending = "PENDING"
    case redeemed = "COMPLETED"
}
