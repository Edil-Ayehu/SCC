//
//  EventCard.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct EventCard: View {

    let event: EventResponse

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            
            RemoteImage(
                url: event.bannerImage,
                height: 180,
                cornerRadius: 20,
                padding: 80
            )
            .frame(width: 240)

            VStack(alignment: .leading, spacing: 12) {

                Text(event.eventType)
                    .font(.custom("Outfit-Medium", size: 12))
                    .foregroundColor(.primaryPurple)

                Text(event.title)
                    .font(.custom("Outfit-Medium", size: 14))
                
                Label(
                    "Starts: \(event.startDate.formattedDateTime())",
                    systemImage: "clock"
                )
                .font(.custom("Outfit-Medium", size: 12))
                .foregroundColor(.black.opacity(0.6))

                
                Label(
                    "Ends: \(event.endDate.formattedDateTime())",
                    systemImage: "flag"
                )
                .font(.custom("Outfit-Medium", size: 12))
                .foregroundColor(.black.opacity(0.6))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
        }
        .frame(width: 240, height: 320)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 8)
        .padding(.bottom, 4)
    }
}
