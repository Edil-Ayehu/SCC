//
//  PasswordField.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//


import SwiftUI

struct PasswordField: View {

    let title: String

    @Binding var text: String

    let isSecure: Bool

    let icon: String

    let onToggleVisibility: () -> Void

    var body: some View {

        HStack(spacing: 14) {

            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 22)

            Group {

                if isSecure {

                    SecureField(title, text: $text)

                } else {

                    TextField(title, text: $text)
                }
            }
            .font(.custom("Outfit-Regular", size: 16))

            Button(action: onToggleVisibility) {

                Image(systemName: isSecure ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 18)
        .frame(height: 62)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.18), lineWidth: 1)
        )
    }
}
