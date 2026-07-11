//
//  VoucherDetailSheet.swift
//  SCC
//
//  Created by Edil on 10/07/2026.
//

import SwiftUI

struct VoucherDetailSheet: View {

    let voucher: VoucherResponse

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: 20) {
                    Spacer().frame(height: 8)

                    Text("Voucher Details")
                        .font(.custom("Outfit-Medium", size: 18))

                    VStack(alignment: .leading, spacing: 8) {

                        Text("Voucher Code")
                            .font(.custom("Outfit-Regular", size: 14))
                            .foregroundColor(.gray)

                        Text(voucher.code)
                            .font(.custom("Outfit-Bold", size: 20))
                            .foregroundColor(.primaryPurple)
                    }

                    Divider()

                    Text("Products")
                        .font(.custom("Outfit-Medium", size: 18))

                    LazyVStack(spacing: 16) {

                        ForEach(voucher.items) { item in
                            VoucherProductRow(item: item)
                        }
                    }
                }
                .padding()
            }
        }
    }
}



struct VoucherProductRow: View {

    let item: VoucherItemResponse

    var body: some View {

        HStack(spacing: 14) {
            
            RemoteImage(
                url: item.product.image,
                height: 64,
                width: 64,
                cornerRadius: 18,
                padding: 20
            )


            VStack(alignment: .leading, spacing: 6) {

                Text(item.product.name)
                    .font(.custom("Outfit-Medium", size: 16))

                Text("Quantity: \(item.quantity)")
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
