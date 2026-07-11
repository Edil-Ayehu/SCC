//
//  FavoriteCardSkeleton.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct FavoriteCardSkeleton: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 22) {

            // Header

            HStack(alignment: .top) {

                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 70, height: 70)

                VStack(alignment: .leading, spacing: 10) {

                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 130, height: 16)

                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 90, height: 14)
                }

                Spacer()

                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 10, height: 18)
            }


            // Bottom

            HStack {

                HStack(spacing: -14) {

                    ForEach(0..<3, id: \.self) { _ in

                        Circle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: 42, height: 42)
                    }
                }

                Spacer()

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 90, height: 38)
            }
        }
        .padding(22)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .shadow(
            color: .black.opacity(0.05),
            radius: 14,
            y: 5
        )
        .redacted(reason: .placeholder)
    }
}
