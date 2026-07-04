//
//  PopularProductsSection.swift
//  SCC
//
//  Created by Edil on 30/06/2026.
//

import SwiftUI


struct PopularProductsSection: View {
    
    @Binding var selectedTab: Tab
    
    @EnvironmentObject var vm: ProductViewModel

    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    @EnvironmentObject var router: AppRouter
    
    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {

                Text("Popular Products")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()

                
                Button {
                    selectedTab = .products
                } label: {
                    Text("See All")
                        .font(.custom("Outfit-Medium", size: 14))
                }
            }
            .padding(.horizontal, 20)

            LazyVGrid(columns: columns, spacing: 16) {

                ForEach(vm.products.prefix(4)) { product in
                    ProductCard(product: product)
                        .onTapGesture {
                            router.push(.productDetails(product))
                        }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer().frame(height: 10)
        }
    }
}

