//
//  VouchersView.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//


import SwiftUI

enum VoucherTab: String, CaseIterable {
    case pending = "Pending"
    case redeemed = "Redeemed"
}

struct VoucherView: View {

    @State private var selectedTab: VoucherTab = .pending
    
    var filteredVouchers: [VoucherResponse] {
        selectedTab == .pending
           ? myVoucherVM.pendingVouchers
           : myVoucherVM.redeemedVouchers
    }
    
    @State private var selectedVoucher: VoucherResponse?
    @State private var showVoucherSheet = false
    
    @EnvironmentObject private var myVoucherVM: MyVoucherViewModel

    var body: some View {
        VStack(spacing: 0) {

            Text("My Orders")
                .font(.custom("Outfit-Medium", size: 18))
                .padding(.top,20)

            VoucherSegmentControl(
                selectedTab: $selectedTab
            )
            .padding(.horizontal,20)
            .padding(.top,24)

            HStack {

                Text(
                    selectedTab == .pending
                    ? "Pending Vouchers"
                    : "Redeemed Vouchers"
                )
                .font(.custom("Outfit-Medium", size: 16))

                Spacer()

                Text("\(filteredVouchers.count)")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal,20)
            .padding(.top,26)
            
                if (myVoucherVM.isLoading) {
                    ScrollView(showsIndicators: false) {
                        LazyVStack (spacing: 20) {
                            ForEach(0..<5, id: \.self) { _ in
                                VoucherCardSkeleton()
                            }
                        }
                        .padding(20)
                    }
                } else {
                    ScrollView(showsIndicators: false) {
                        if filteredVouchers.isEmpty {
                            
                            
                            VStack {
                                EmptyVoucherView(
                                    title: selectedTab == .pending ? "No Pending Vouchers" : "No Redeemed Vouchers",
                                    subtitle: selectedTab == .pending ? "You don't have any pending vouchers yet." : "Your redeemed vouchers will appear here."
                                )
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 80)
                            
                            
                            
                        } else {
                            LazyVStack(spacing:20) {

                                ForEach(filteredVouchers) { voucher in

                                    VoucherCard(
                                        voucher: voucher,
                                        onCopy: {
                                            UIPasteboard.general.string = voucher.code
                                        },
                                        onTap: {
                                            print(voucher.code)
                                            selectedVoucher = voucher
                                            showVoucherSheet = true
                                        }
                                    )
                                }
                            }
                            .padding(20)


                        }

                    }
                    .refreshable {
                        await myVoucherVM.loadVouchers()
                    }

                }


                        
        }
        .background(Color.white)
        .sheet(item: $selectedVoucher) { voucher in
            VoucherDetailSheet(voucher: voucher)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .cornerRadius(32)
        }
    }
}
