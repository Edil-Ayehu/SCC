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
                    Text("Home")
                }

            Text("Stores")
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Stores")
                }

            Text("Vouchers")
                .tabItem {
                    Image(systemName: "tag.fill")
                    Text("Vouchers")
                }

            Text("Cart")
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }

            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

