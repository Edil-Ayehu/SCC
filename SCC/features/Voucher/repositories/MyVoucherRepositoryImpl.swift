//
//  MyVoucherRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//
import Foundation

final class MyVoucherRepositoryImpl: MyVoucherRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getMyVouchers() async throws -> [VoucherResponse] {
        try await apiClient.request(
            endpoint: Endpoint.myVouchers
        )
    }
    
}
