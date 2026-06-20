//
//  EventCard.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct EventCard: View {

    let event: Event

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            Image(event.image)
                .resizable()
                .scaledToFill()
                .frame(width: 240, height: 180)
                .clipped()

            VStack(alignment: .leading, spacing: 12) {

                Text(event.category)
                    .font(.system(size: 14))
                    .foregroundColor(.pink)

                Text(event.title)
                    .font(.system(size: 16, weight: .bold))

                Label("Starts: Sep 17, 2026", systemImage: "clock")
                    .font(.caption)

                Label("Ends: Sep 25, 2026", systemImage: "flag")
                    .font(.caption)
            }
            .padding()
        }
        .frame(width: 240, height: 320)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 8)
        .padding(.bottom, 4)
    }
}
