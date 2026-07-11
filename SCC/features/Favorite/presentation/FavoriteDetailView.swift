//
//  FavoriteDetailView.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct FavoriteDetailView: View {

    @Environment(\.dismiss) private var dismiss

    let favorite: FavoriteResponse
    
    @EnvironmentObject var router: AppRouter

    var body: some View {

        VStack(spacing: 0) {
            HStack {
                Button {
                    router.pop()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
                
                Text("Favorite Detail")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding()
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            
            

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    FavoriteInfoCard(favorite: favorite)

                    LazyVStack(spacing: 24) {

                        ForEach(favorite.items) { product in
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
                    height: 52
                )
            }
            .padding(20)
        }
        .background(Color.white)
//        .navigationBarTitle(favorite.name ?? "Favorite items")
        .navigationBarBackButtonHidden(true)
    }
}
