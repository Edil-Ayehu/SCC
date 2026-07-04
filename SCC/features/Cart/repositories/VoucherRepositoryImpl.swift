//
//  VoucherRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//
import Foundation

final class VoucherRepositoryImpl: VoucherRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func generateVoucher(
        request: GenerateVoucherRequest
    ) async throws -> GenerateVoucherResponse {
        try await apiClient.request(
            endpoint: Endpoint.generateVoucher,
            method: "POST",
            body: request
        )
    }
}
