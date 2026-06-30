//
//  HomeContentView.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct HomeContentView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {

                HeaderSection(selectectTab: $selectedTab)

                VStack(spacing: 24) {

                    UpcomingEventsSection()

                    StoresSection()
                }
                .padding(.top, 24)
                .background(Color(.white))
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

