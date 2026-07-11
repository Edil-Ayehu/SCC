//
//  CustomButton.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void

    var isEnabled: Bool = true
    var isLoading: Bool = false
    var height: CGFloat = 56
    var backgroundColor: Color = .primaryPurple

    var body: some View {
        Button(action: action) {
            HStack {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .font(.custom("Outfit-Medium", size: 16))
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .foregroundColor(.white)
            .background(
                isEnabled
                    ? backgroundColor
                    : Color.gray.opacity(0.5)
            )
            .cornerRadius(32)
        }
        .disabled(!isEnabled || isLoading)
    }
}
