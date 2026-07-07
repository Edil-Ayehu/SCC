//
//  VoucherRepository.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//
import Foundation

protocol MyVoucherRepository {
    
    func getMyVouchers()  async throws -> [VoucherResponse]
    
}
