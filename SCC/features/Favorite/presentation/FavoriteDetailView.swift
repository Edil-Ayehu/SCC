//
//  FavoriteDetailView.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct FavoriteDetailView: View {

    @Environment(\.dismiss) private var dismiss

    let favorite: FavoriteCollection

    var body: some View {

        VStack(spacing: 0) {

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    FavoriteInfoCard(favorite: favorite)

                    LazyVStack(spacing: 24) {

                        ForEach(favorite.products) { product in
                            FavoriteProductRow(product: product)
                        }
                    }
                }
                .padding(20)
            }

            HStack(spacing: 16) {

                CustomButton(
                    title: "Generate Voucher",
                    action: {

                    },
                    height: 52
                )

                CustomButton(
                    title: "Delete Favorite",
                    action: {

                    },
//                    backgroundColor: Color.red,
                    height: 52
                )
            }
            .padding(20)
        }
        .background(Color.white)
        .navigationBarTitle(favorite.name)
    }
}
