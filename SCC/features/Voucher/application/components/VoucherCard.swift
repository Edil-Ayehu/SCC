//
//  VoucherCard.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//
import SwiftUI

struct VoucherCard: View {

    let voucher: VoucherResponse

    let onCopy: () -> Void
    let onTap: () -> Void

    var body: some View {

        VStack(spacing:0) {

            HStack(spacing:14) {

                Circle()
                    .fill(Color.white.opacity(0.15))
                    .frame(width:40,height:40)
                    .overlay {

                        Image(systemName: "bag")
                            .foregroundColor(.white)
                    }

                Text("\(voucher.items.count) Products")
                    .font(.custom("Outfit-Medium", size:14))
                    .foregroundColor(.white)

                Spacer()

            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color.primaryPurple)

            VStack(alignment:.leading,spacing:16) {

                Text("Voucher Code")
                    .font(.custom("Outfit-Medium", size:16))

                HStack {

                    Text(voucher.code)
                        .font(.custom("Outfit-Bold", size:18))
                        .foregroundColor(.primaryPurple)

                    Spacer()

                    Button {

                        onCopy()

                    } label: {

                        Image(systemName:"doc.on.doc")
                            .font(.title3)
                            .foregroundColor(.primaryPurple)
                    }
                }
                .padding(.horizontal,18)
                .frame(height:54)
                .overlay(
                    RoundedRectangle(cornerRadius:18)
                        .stroke(Color.gray.opacity(0.3))
                )

                Button {

                    onTap()

                } label: {

                    HStack(spacing:8) {

                        Image(systemName:"hand.tap")

                        Text("Tap to view voucher details")
                    }
                    .font(.custom("Outfit-Regular", size:15))
                    .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
        }
        .clipShape(
            RoundedRectangle(cornerRadius:26)
        )
        .shadow(
            color: .black.opacity(0.06),
            radius: 12,
            y: 4
        )
        .contentShape(Rectangle())     // Entire card is tappable
        .onTapGesture {
            onTap()
        }
    }
}
