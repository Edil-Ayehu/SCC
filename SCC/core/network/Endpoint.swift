//
//  Endpoint.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

enum Endpoint {
    // MARK: Base URL
    static let baseUrl = "https://cash-carry-smart-ordering-system.onrender.com"
    
    // MARK: Authentication
    static let login = "\(baseUrl)/auth/login"
    static let register = "\(baseUrl)/auth/register"
    
    // MARK: Products
    
    enum Product {

        /// catalog=true is always required
        static func list(category: String? = nil,
                         search: String? = nil) -> String {

            var components = URLComponents(string: "\(baseUrl)/products")!

            var items: [URLQueryItem] = [
                URLQueryItem(name: "catalog", value: "true")
            ]

            if let category,
               !category.isEmpty {
                items.append(
                    URLQueryItem(name: "category",
                                 value: category)
                )
            }

            if let search,
               !search.isEmpty {
                items.append(
                    URLQueryItem(name: "search",
                                 value: search)
                )
            }

            components.queryItems = items

            return components.url!.absoluteString
        }
    }
    
    // MARK: Stores
    
    // MARK: Orders
    
    // MARK: Voucher
    static let generateVoucher = "\(baseUrl)/vouchers"
    
    // MARK: Prifle
    static let profile = "\(baseUrl)/auth/me"
    
    static let changePassword = "\(baseUrl)/auth/change-password"
    
    
    // MARK: Events
    enum Event {
        static let list = "\(baseUrl)/events/active"
    }
    
}
