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
    @Published var isRefreshing = false
    
    @Published var errorMessage: String?
    
    private let repository: MyVoucherRepository
    
    init(repository: MyVoucherRepository) {
        self.repository = repository
    }
    
    func loadVouchers(refresh: Bool = false) async {
        
        if refresh {
            isRefreshing = true
        } else {
            isLoading = true
        }
        
        errorMessage = nil
        
        defer {
            isLoading = false
            isRefreshing = false
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
