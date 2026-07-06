//
//  FloatingTextField.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

import SwiftUI

struct FloatingTextField: View {

    let title: String

    @Binding var text: String

    var keyboardType: UIKeyboardType = .default

    @FocusState private var isFocused: Bool

    var body: some View {

        ZStack(alignment: .topLeading) {

            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    isFocused
                    ? Color.primaryPurple
                    : Color.gray.opacity(0.25),
                    lineWidth: 1
                )
                .frame(height: 74)

            Text(title)
                .font(.custom("Outfit-Regular", size: 12))
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .background(Color.white)
                .offset(x: 16, y: -8)

            TextField("", text: $text)
                .font(.custom("Outfit-Regular", size: 16))
                .keyboardType(keyboardType)
                .focused($isFocused)
                .padding(.horizontal, 16)
                .frame(height: 74)
        }
    }
}
