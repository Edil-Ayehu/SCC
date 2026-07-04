//
//  ProductsView.swift
//  SCC
//
//  Created by Edil on 25/06/2026.
//

import SwiftUI
import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let category: String
    let name: String
    let imageName: String
}


struct ProductsView: View {

    @State private var searchText = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject var vm : ProductViewModel
    

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
                            text: $vm.search
                        )
                        .font(.custom("Outfit-Regular", size: 14))
                        .onSubmit {
                            Task {
                                await vm.loadProducts()
                            }
                        }
                    }
                    .padding()
                    .background(Color(.gray).opacity(0.1))
                    .cornerRadius(16)

                    LazyVGrid(columns: columns, spacing: 12) {
                        if vm.isLoading {
                            // showing loading indicator
                            ForEach(0..<8, id: \.self) {_ in
                                ProductCardSkeleton()
                                    .redacted(reason: .placeholder)
                            }
                        } else {
                            ForEach(vm.products) { product in
                                ProductCard(product: product)
                                    .onTapGesture {
                                        router.push(.productDetails(product))
                                    }
                            }
                        }
                        
                    }
                }
                .padding(.horizontal, 16)
            }
            
            Divider()

        }
        .background(Color.white)
//        .task {
//            await vm.loadProducts()
//        }
    }
}
