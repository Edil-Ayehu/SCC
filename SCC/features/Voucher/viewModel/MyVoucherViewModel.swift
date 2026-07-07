//
//  MyVoucherViewModel.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//
import Foundation

@MainActor
final class MyVoucherViewModel: ObservableObject {
    @Published var vouchers: [VoucherResponse] = []
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    private let repository: MyVoucherRepository
    
    init(repository: MyVoucherRepository) {
        self.repository = repository
    }
    
    func loadVouchers() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            vouchers = try await repository.getMyVouchers()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    var pendingVouchers: [VoucherResponse] {
        vouchers.filter { $0.status == .pending }
    }
    
    var redeemedVouchers: [VoucherResponse] {
        vouchers.filter { $0.status == .redeemed }
    }
}
