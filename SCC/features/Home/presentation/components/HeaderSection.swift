//
//  HeaderSection.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct HeaderSection: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.gradientStart,
                    Color.gradientEnd
                ],
                startPoint: .leading,
                endPoint: .trailing
            )

            VStack(alignment: .leading) {
                
                Spacer().frame(height: 48)

                HStack(alignment: .top) {

                    VStack(alignment: .leading, spacing: 8) {

                        Text("Good Morning! 👋")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.9))

                        Text("What are we\nordering today?")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }

                    Spacer()

                    HStack(spacing: 12) {

                        HeaderIconButton(icon: "bag")

                        HeaderIconButton(icon: "heart.fill")
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 60)
        }
        .frame(height: 280)
    }
}
