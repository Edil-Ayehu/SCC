//
//  EventDetailSheet.swift
//  SCC
//
//  Created by Edil on 30/06/2026.
//
import SwiftUI

struct EventDetailSheet: View {

    let event: EventResponse

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            RemoteImage(
                url: event.bannerImage,
                height: 220,
                cornerRadius: 20,
            )

            Text(event.eventType)
                .font(.custom("Outfit-Regular", size: 12))
                .foregroundColor(.blue)

            Text(event.title)
                .font(.custom("Outfit-Regular", size: 18))
                .bold()

            Text(event.description)
                .font(.custom("Outfit-Regular", size: 12))

            Spacer()
        }
        .padding()
    }
}

