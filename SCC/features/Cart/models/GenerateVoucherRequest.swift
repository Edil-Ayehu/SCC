//
//  GenerateVoucherRequest.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import Foundation

struct GenerateVoucherRequest: Encodable {
    let items: [VoucherItemRequest]
}

struct VoucherItemRequest: Encodable {
    let productId: String
    let quantity: Int
}
