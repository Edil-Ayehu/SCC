//
//  GenerateVoucherResponse.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import Foundation

struct GenerateVoucherResponse: Decodable, Identifiable {

    let id: String
    let code: String
    let userId: String
    let status: String
    let totalAmount: Double
    let discountPercentage: Double
    let discountAmount: Double
    let createdAt: String
    let updatedAt: String
    let items: [VoucherItemResponse]
}

struct VoucherItemResponse: Decodable, Identifiable {

    let id: String
    let voucherId: String
    let productId: String
    let quantity: Int
    let priceAtBooking: Double
    let isFulfilled: Bool
    let refundedQuantity: Int
}
