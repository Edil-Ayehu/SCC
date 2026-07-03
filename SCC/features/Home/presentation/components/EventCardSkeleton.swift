//
//  EventCardSkeleton.swift
//  SCC
//
//  Created by Edil on 03/07/2026.
//

import SwiftUI

struct EventCardSkeleton: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 180)

            VStack(alignment: .leading, spacing: 12) {

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 80, height: 14)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 18)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 160, height: 14)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 160, height: 14)
            }
            .padding(12)
        }
        .frame(width: 240, height: 320)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 8)
        .padding(.bottom, 4)
        .redacted(reason: .placeholder)
    }
}

