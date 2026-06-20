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
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

//#Preview {
//    AuthHeader()
//}
