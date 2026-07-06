//
//  OrderSuccessDialog.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI

struct OrderSuccessDialog: View {

    let voucherCode: String
    let onDone: () -> Void
    let onCopy: () -> Void

    init(
        voucherCode: String,
        onDone: @escaping () -> Void,
        onCopy: @escaping () -> Void,
    ) {
        self.voucherCode = voucherCode
        self.onDone = onDone
        self.onCopy = onCopy
    }

    var body: some View {

        VStack(spacing: 0) {

            // MARK: Success Icon
            
            Spacer().frame(height: 8)

            Image(systemName: "bag")
                .font(.system(size: 32))
                .foregroundColor(.green)
                .background(
                    Circle()
                        .fill(Color.green.opacity(0.1))
                        .frame(width: 60, height: 60)
                )

            Spacer().frame(height: 24)

            // MARK: Title

            Text("Pre-Order Confirmed!")
                .font(.custom("Outfit-Medium", size: 18))
                .multilineTextAlignment(.center)

            Spacer().frame(height: 10)

            Text("Your items are reserved and ready for pickup.")
                .font(.custom("Outfit-Regular", size: 12))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)

            Spacer().frame(height: 24)

            // MARK: Voucher

            VStack(spacing: 8) {

                Text("VOUCHER CODE")
                    .font(.custom("Outfit-Regular", size: 12))
                    .tracking(1.5)
                    .foregroundStyle(.gray)
                
                Spacer().frame(height: 8)

                HStack {

                    Text(voucherCode)
                        .font(.custom("Outfit-Bold", size: 14))
                        .foregroundColor(.primaryPurple)

                    Spacer().frame(width: 30)
                    
                    CustomButton(
                        title: "Copy Code",
                        action: onCopy,
                        height: 38
                    )

                }
            }

            Spacer().frame(height: 28)

            // MARK: Pickup Note

            HStack(alignment: .top, spacing: 10) {

                Image(systemName: "storefront")
                    .foregroundColor(.primaryPurple)

                Text("Pick up your reserved items from the store by presenting this voucher code and completing your payment.")
                    .font(.custom("Outfit-Regular", size: 12))
                    .foregroundStyle(.primary)
            }
            .padding(8)
            .background(Color.orange.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            Spacer().frame(height: 28)
            
            CustomButton(
                title: "Got It",
                action: onDone,
                height: 46
            )

        }
        .padding(28)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: .black.opacity(0.08), radius: 20, y: 10)
        .padding(.horizontal, 24)
    }
}
