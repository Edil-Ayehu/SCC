//
//  UpcomingEventsSection.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct UpcomingEventsSection: View {

    let events = [
        Event(
            title: "Grand Wedding Banquet",
            category: "Wedding Event",
            image: "event1"
        ),
        Event(
            title: "Ethiopian New Year Celebration",
            category: "Holiday",
            image: "event2"
        )
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Upcoming Events")
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 16) {

                    ForEach(events) { event in
                        EventCard(event: event)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
