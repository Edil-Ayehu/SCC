//
//  ProductsView.swift
//  SCC
//
//  Created by Edil on 25/06/2026.
//

import SwiftUI
import Foundation
import AlertToast

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
    
    @State private var showToast = false
    

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {

                VStack(spacing: 20) {

                    Text("Products")
                        .font(.custom("Outfit-Medium", size: 18))
                        .padding(.top, 20)

//                    HStack(spacing: 12) {
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//
//                        TextField(
//                            "Search your favorite drinks or meals...",
//                            text: $vm.search
//                        )
//                        .font(.custom("Outfit-Regular", size: 14))
//                        .onSubmit {
//                            Task {
//                                await vm.loadProducts()
//                            }
//                        }
//                    }
//                    .padding()
//                    .background(Color(.gray).opacity(0.1))
//                    .cornerRadius(16)
                    HStack(spacing: 12) {

                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)

                        TextField(
                            "Search your favorite drinks or meals...",
                            text: $vm.search
                        )
                        .font(.custom("Outfit-Regular", size: 14))
                        .submitLabel(.search)
                        .onSubmit {
                            Task {
                                await vm.loadProducts()
                            }
                        }

                        if !vm.search.isEmpty {
                            Button {
                                vm.search = ""

                                Task {
                                    await vm.loadProducts()   // Reload all products after clearing
                                }
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray.opacity(0.7))
                                    .font(.system(size: 18))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    LazyVGrid(columns: columns, spacing: 12) {
                        if vm.isLoading {
                            // showing loading indicator
                            ForEach(0..<8, id: \.self) {_ in
                                ProductCardSkeleton()
                                    .redacted(reason: .placeholder)
                            }
                        } else {
                            ForEach(vm.products) { product in
                                ProductCard(product: product, showToast: $showToast)
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
        .toast (isPresenting: $showToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "Added to Cart!"
            )
        }
    }
}
