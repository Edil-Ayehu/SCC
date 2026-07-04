//
//  VoucherRepository.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

protocol VoucherRepository {
    
    func generateVoucher(
        request: GenerateVoucherRequest
    ) async throws -> GenerateVoucherResponse
    
}
