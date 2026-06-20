//
//  StoreCard.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct StoreCard: View {

    let store: Store

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {
            
            Image(store.image)
                .resizable()
                .scaledToFit()
                .clipped()
            
            VStack (alignment: .leading){
                Text(store.name)
                    .font(.system(size: 16, weight: .semibold))

                Label("Cape Town", systemImage: "location")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            
        }
        .frame(height: 200)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.06), radius: 8)
    }
}
