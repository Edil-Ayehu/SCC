//
//  HomeView.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            HomeContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .font(.system(size: 18))
                    Text("Home")
                        .font(.custom("Outfit-Regular", size: 12))
                }

            ProductsView()
                .tabItem {
                    Image(systemName: "fork.knife")
                        .font(.system(size: 18))
                    Text("Products")
                        .font(.custom("Outfit-Regular", size: 12))
                }

            Text("Vouchers")
                .tabItem {
                    Image(systemName: "tag.fill")
                        .font(.system(size: 18))
                    Text("Vouchers")
                        .font(.custom("Outfit-Regular", size: 12))
                }

            Text("Cart")
                .tabItem {
                    Image(systemName: "cart.fill")
                        .font(.system(size: 18))
                    Text("Cart")
                        .font(.custom("Outfit-Regular", size: 12))
                }

            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                        .font(.system(size: 18))
                    Text("Profile")
                        .font(.custom("Outfit-Regular", size: 12))
                }
        }
    }
}

