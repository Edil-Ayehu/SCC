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

    let vouchers: [Voucher] = [
        Voucher(code: "IYGULTFVG6", productCount: 1, isRedeemed: false),
        Voucher(code: "9GKZP6H4NB", productCount: 2, isRedeemed: true)
    ]

    var filteredVouchers: [Voucher] {
        vouchers.filter {
            selectedTab == .pending
            ? !$0.isRedeemed
            : $0.isRedeemed
        }
    }

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
                .font(.custom("Outfit-SemiBold", size: 18))

                Spacer()

                Text("\(filteredVouchers.count)")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal,20)
            .padding(.top,26)
            
            if filteredVouchers.isEmpty {
                
                Spacer()
                
                EmptyVoucherView(
                    title: selectedTab == .pending ? "No Pending Vouchers" : "No Redeemed Vouchers",
                    subtitle: selectedTab == .pending ? "You don't have any pending vouchers yet." : "YOur redeemed vouchers will appear here."
                )
                
                Spacer()
            } else {
                ScrollView(showsIndicators: false) {

                    LazyVStack(spacing:20) {

                        ForEach(filteredVouchers) { voucher in

                            VoucherCard(
                                voucher: voucher,
                                onCopy: {
                                    UIPasteboard.general.string = voucher.code
                                },
                                onTap: {
                                    print(voucher.code)
                                }
                            )
                        }
                    }
                    .padding(20)
                }


            }

        }
        .background(Color.white)
    }
}
