//
//  StoreListCard.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct StoreListCard: View {
    
    let store: Store
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            ZStack {
                if !store.image.isEmpty {
                    Image(store.image)
                        .resizable()
                        .scaledToFill()
                } else {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.gray.opacity(0.15))
                        .overlay {
                            Image(systemName: "photo")
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                }
            }
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            HStack(alignment: .top) {
                
                Text(store.name)
                    .font(.system(size: 18, weight: .bold))
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("4.7")
                        .font(.system(size: 16))
                }
            }
            
            HStack(spacing: 8) {
                Image(systemName: "location")
                    .font(.title3)
                
                Text(store.location)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(
            color: .black.opacity(0.03),
            radius: 8,
            x: 0,
            y: 4
        )
    }
}
