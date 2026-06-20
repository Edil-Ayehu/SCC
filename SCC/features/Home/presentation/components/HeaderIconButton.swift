//
//  HeaderIconButton.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct HeaderIconButton: View {
    let icon: String

    var body: some View {
        Button {

        } label: {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.white)
                .frame(width: 54, height: 54)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.15))
                )
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.2))
                )
        }
    }
}
