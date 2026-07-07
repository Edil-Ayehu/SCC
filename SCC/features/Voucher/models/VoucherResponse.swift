//
//  VoucherResponse.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//

import Foundation

struct VoucherResponse: Decodable, Identifiable, Hashable {

    let id: String
    let code: String
    let userId: String
    let status: VoucherStatus
    let totalAmount: Double
    let discountPercentage: Double
    let discountAmount: Double
    let createdAt: String
    let updatedAt: String
    let items: [VoucherItemResponse]

    enum CodingKeys: String, CodingKey {
        case id
        case code
        case userId
        case status
        case totalAmount
        case discountPercentage
        case discountAmount
        case createdAt
        case updatedAt
        case items
    }
}


struct VoucherItemResponse: Decodable, Identifiable, Hashable {

    let id: String
    let voucherId: String
    let productId: String
    let quantity: Int
    let priceAtBooking: Double
    let isFulfilled: Bool
    let refundedQuantity: Int
    let product: ProductSummaryResponse

    enum CodingKeys: String, CodingKey {
        case id
        case voucherId
        case productId
        case quantity
        case priceAtBooking
        case isFulfilled
        case refundedQuantity
        case product
    }
}


struct ProductSummaryResponse: Decodable, Identifiable, Hashable {

    let id: String
    let name: String
    let description: String
    let image: String?
    let stockQuantity: Int
    let category: String
    let isActive: Bool
    let barcode: String
    let stockInPrice: Double
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
        case stockQuantity
        case category
        case isActive
        case barcode
        case stockInPrice
        case createdAt
        case updatedAt
    }
}
