//
//  ProductCard.swift
//  SCC
//
//  Created by Edil on 25/06/2026.
//

import SwiftUI
import AlertToast

struct ProductCard: View {

    let product: ProductResponse
    
    @StateObject private var cartVM = DIContainer.shared.makeCartViewModel()
    
    @Binding var showToast: Bool

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {
            
            RemoteImage(
                url: product.image,
                height: 120,
                cornerRadius: 18,
                padding: 60
            )
            
            VStack (alignment: .leading){

                Text(product.category?.name ?? "")
                    .font(.custom("Outfit-Regular", size: 12))
                    .foregroundColor(.primaryPurple)

                Text(product.name)
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.black)
                    .lineLimit(2)

                HStack {
                    Spacer()

                    Button {
                        if cartVM.add(product: product) {
                            showToast = true
                        }
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 34, height: 34)
                            .background(
                                Circle()
                                    .fill(Color(red: 20/255,
                                                green: 27/255,
                                                blue: 93/255))
                            )
                    }
                }
            }
            .padding(12)


        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(
            color: .black.opacity(0.05),
            radius: 12,
            x: 0,
            y: 6
        )
    }
}

