//
//  EventDetailSheet.swift
//  SCC
//
//  Created by Edil on 30/06/2026.
//
import SwiftUI

struct EventDetailSheet: View {

    let event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Image(event.image)
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            Text(event.category)
                .font(.custom("Outfit-Regular", size: 12))
                .foregroundColor(.blue)

            Text(event.title)
                .font(.custom("Outfit-Regular", size: 18))
                .bold()

            Text("""
            This is where you can show the event description, date, venue, available offers, and any other information.
            """)

            Spacer()
        }
        .padding()
    }
}

