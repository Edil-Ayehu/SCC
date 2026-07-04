//
//  UpcomingEventsSection.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct UpcomingEventsSection: View {
    
    @State private var selectedEvent: EventResponse?
    
    @StateObject private var vm = DIContainer.shared.makeEventViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Upcoming Events")
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 16) {
                    if (vm.isLoading) {
                        ForEach(0..<8, id: \.self) {_ in
                            EventCardSkeleton()
                                .redacted(reason: .placeholder)
                        }
                    } else {
                        ForEach(vm.events) { event in
                            EventCard(event: event)
                                .onTapGesture {
                                    selectedEvent = event
                                }
                        }
                    }

                    
                }
                .padding(.horizontal, 32)
            }
            
        }
        .task {
            await vm.loadEvents()
        }
        .sheet(item: $selectedEvent) { event in
            EventDetailSheet(event: event)
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
                .cornerRadius(32)
            
        }
    }
}
