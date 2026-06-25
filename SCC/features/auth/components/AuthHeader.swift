//
//  AuthHeader.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

struct AuthHeader: View {
    let title: String
    let description: String
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.custom("Outfit-SemiBold", size: 28))

            Text(description)
                .font(.custom("Outfit-Regular", size: 14))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}
