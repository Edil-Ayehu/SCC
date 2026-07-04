//
//  HomeView.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Tab = .home
    
    @StateObject private var vm = DIContainer.shared.makeProductViewModel()
        
    var body: some View {
        TabView (selection: $selectedTab) {
            HomeContentView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                        .font(.system(size: 18))
                    Text("Home")
                        .font(.custom("Outfit-Regular", size: 12))
                }
                .environmentObject(vm)
                .tag(Tab.home)

            ProductsView()
                .tabItem {
                    Image(systemName: "fork.knife")
                        .font(.system(size: 18))
                    Text("Products")
                        .font(.custom("Outfit-Regular", size: 12))
                }
                .environmentObject(vm)
                .tag(Tab.products)

            Text("Vouchers")
                .tabItem {
                    Image(systemName: "tag.fill")
                        .font(.system(size: 18))
                    Text("Vouchers")
                        .font(.custom("Outfit-Regular", size: 12))
                }
                .tag(Tab.vouchers)

            Text("Cart")
                .tabItem {
                    Image(systemName: "cart.fill")
                        .font(.system(size: 18))
                    Text("Cart")
                        .font(.custom("Outfit-Regular", size: 12))
                }
                .tag(Tab.cart)

            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                        .font(.system(size: 18))
                    Text("Profile")
                        .font(.custom("Outfit-Regular", size: 12))
                }
                .tag(Tab.profile)
        }
        .task {
            await vm.loadProducts()
        }
    }
}

