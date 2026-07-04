//
//  VoucherViewModel.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import Foundation

@MainActor
final class VoucherViewModel: ObservableObject {
    
    @Published var voucher: GenerateVoucherResponse?
    
    @Published var isLoading = false
    
    @Published var errorMessage: String?
    
    private let repository: VoucherRepository
    
    init(repository: VoucherRepository) {
        self.repository = repository
    }
    
    func generateVoucher(cartItems: [CartItem]) async {
        
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        let request = GenerateVoucherRequest(
            items: cartItems.map {
                VoucherItemRequest(
                    productId: $0.product.id,
                    quantity: $0.quantity
                )
            }
        )
        
        do {
            voucher = try await repository.generateVoucher(request: request)
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
