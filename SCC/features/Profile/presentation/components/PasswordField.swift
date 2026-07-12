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
    @Binding var isSecure: Bool
    let icon: String

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

            Button {
                isSecure.toggle()
            } label: {
                Image(systemName: isSecure ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 18)
        .frame(height: 62)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.18), lineWidth: 1)
        )
    }
}
