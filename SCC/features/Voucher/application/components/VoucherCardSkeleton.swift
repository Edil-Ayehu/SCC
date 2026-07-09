//
//  VoucherCardSkeleton.swift
//  SCC
//
//  Created by Edil on 08/07/2026.
//

import SwiftUI

struct VoucherCardSkeleton: View {

    var body: some View {

        VStack(spacing: 0) {

            // Header
            HStack(spacing: 14) {

                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 40, height: 40)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 100, height: 16)

                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.5))

            VStack(alignment: .leading, spacing: 16) {

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.25))
                    .frame(width: 110, height: 16)

                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.gray.opacity(0.25))
                    .frame(height: 54)
                    .overlay {
                        HStack {

                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.25))
                                .frame(width: 140, height: 18)

                            Spacer()

                            Circle()
                                .fill(Color.gray.opacity(0.25))
                                .frame(width: 24, height: 24)
                        }
                        .padding(.horizontal, 18)
                    }

                HStack(spacing: 8) {

                    Circle()
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 18, height: 18)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 180, height: 15)
                }
            }
            .padding()
            .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .shadow(
            color: .black.opacity(0.06),
            radius: 12,
            y: 4
        )
    }
}
