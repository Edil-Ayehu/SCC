//
//  HomeContentView.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI
import AlertToast

struct HomeContentView: View {
    @Binding var selectedTab: Tab
    
    @EnvironmentObject var vm: ProductViewModel
    
    @State private var showToast = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {

                HeaderSection(selectectTab: $selectedTab)

                VStack(spacing: 24) {

                    UpcomingEventsSection()
                    
                    PopularProductsSection(selectedTab: $selectedTab, showToast: $showToast)

//                    StoresSection()
                }
                .padding(.top, 24)
                .background(Color(.white))
            }
        }
        .ignoresSafeArea(edges: .top)
        .toast (isPresenting: $showToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "Added to Cart!"
            )
        }
    }
}

