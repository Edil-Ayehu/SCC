//
//  ProductsView.swift
//  SCC
//
//  Created by Edil on 25/06/2026.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let category: String
    let name: String
    let imageName: String
}


struct ProductsView: View {

    @State private var searchText = ""

    let products: [Product] = [
        .init(category: "Household", name: "Test", imageName: "store"),
        .init(category: "Bakery", name: "Teff", imageName: "store3"),
        .init(category: "Oil", name: "new product", imageName: "store2"),
        .init(category: "Oil", name: "Cooking Oil 5L", imageName: "store3"),
        .init(category: "Grains", name: "Bulk Rice 10kg", imageName: "store4"),
        .init(category: "Oil", name: "Pro 20", imageName: "store4")
    ]

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        VStack(spacing: 0) {

            ScrollView(showsIndicators: false) {

                VStack(spacing: 20) {

                    Text("Products")
                        .font(.custom("Outfit-Medium", size: 18))
                        .padding(.top, 20)

                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)

                        TextField(
                            "Search your favorite drinks or meals...",
                            text: $searchText
                        )
                        .font(.custom("Outfit-Regular", size: 14))
                    }
                    .padding()
                    .background(Color(.gray).opacity(0.1))
                    .cornerRadius(16)

                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(products) { product in
                            ProductCard(product: product)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }

            Divider()

        }
        .background(Color.white)
    }
}
