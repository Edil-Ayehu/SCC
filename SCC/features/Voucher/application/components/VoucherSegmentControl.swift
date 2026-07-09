//
//  VoucherSegmentControl.swift
//  SCC
//
//  Created by Edil on 07/07/2026.
//

import SwiftUI

struct VoucherSegmentControl: View {

    @Binding var selectedTab: VoucherTab

    var body: some View {

        HStack(spacing:0) {

            ForEach(VoucherTab.allCases,id:\.self) { tab in

                Button {

                    withAnimation(.easeInOut) {
                        selectedTab = tab
                    }

                } label: {

                    Text(tab.rawValue)
                        .font(.custom("Outfit-Medium", size: 16))
                        .foregroundColor(
                            selectedTab == tab
                            ? .white
                            : .black
                        )
                        .frame(maxWidth:.infinity)
                        .frame(height:44)
                        .background(
                            selectedTab == tab
                            ? Color.primaryPurple
                            : Color.clear
                        )
                }
            }
        }
        .background(Color.white)
        .overlay(
            Capsule()
                .stroke(Color.gray.opacity(0.25))
        )
        .clipShape(Capsule())
    }
}
