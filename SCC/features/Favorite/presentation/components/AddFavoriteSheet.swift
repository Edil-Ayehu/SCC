//
//  AddFavoriteSheet.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct AddFavoriteSheet: View {

    @Environment(\.dismiss) private var dismiss

    @Binding var favoriteName: String

    let isLoading: Bool

    let onSave: () -> Void
    let onSkip: () -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: 24) {

            Text("Add to Favorites")
                .font(.custom("Outfit-SemiBold", size: 22))

            VStack(alignment: .leading, spacing: 8) {

                Text("Favorite Name (Optional)")
                    .font(.custom("Outfit-Medium", size: 14))

                TextField(
                    "e.g. Weekly Grocery",
                    text: $favoriteName
                )
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            HStack(spacing: 12) {

                Button {

                    onSkip()

                } label: {

                    Text("Skip")
                        .font(.custom("Outfit-Medium", size: 16))
                        .foregroundColor(.primaryPurple)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .overlay(
                            Capsule()
                                .stroke(Color.primaryPurple, lineWidth: 1.5)
                        )
                }

                CustomButton(
                    title: "Save",
                    action: onSave,
                    isLoading: isLoading,
                    height: 48
                )
            }

            Spacer()

        }
        .padding(20)
    }
}
