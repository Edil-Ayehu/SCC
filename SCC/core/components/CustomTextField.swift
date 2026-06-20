//
//  CustomTextField.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    var label: String? = nil
    var isRequired: Bool = false
    var isPassword: Bool = false
    var prefixIcon: Image? = nil

    @State private var isSecure: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 0, ) {
            if label != nil {
                HStack(spacing: 0) {
                    Text(label!)
                        .font(.custom("Outfit-Regular", size: 12))
                    if isRequired {
                        Text("*").foregroundColor(.red)

                    }
                }
            }

            HStack {
                // ✅ PREFIX ICON
                if let prefixIcon {
                    prefixIcon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                }

                if isPassword && isSecure {
                    SecureField(placeholder, text: $text)
                        .font(.custom("Outfit-Medium", size: 12))
                } else {
                    TextField(placeholder, text: $text)
                        .font(.custom("Outfit-Medium", size: 12))
                }

                if isPassword {
                    Button {
                        isSecure.toggle()
                    } label: {
                        Image(
                            systemName: isSecure ? "eye.slash.fill" : "eye.fill"
                        )
                        .foregroundColor(.gray)
                    }
                }

            }
            .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
            .background(Color.gray.opacity(0.06))
            .cornerRadius(12)
        }
    }
}
