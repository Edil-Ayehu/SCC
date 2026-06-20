//
//  StoresView.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI


struct StoresView: View {
    
    let stores: [Store] = [
        Store(
            name: "Zoe Cash & Carry",
            location: "cape town",
            image: "store"
        ),
        Store(
            name: "Test Store 19",
            location: "Downtown Market, Block B",
            image: "store2"
        ),
        Store(
            name: "Fresh Market",
            location: "Downtown Market, Block B",
            image: "store3"
        )
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            LazyVStack(spacing: 24) {
                ForEach(stores) { store in
                    StoreListCard(store: store)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .background(Color(.white))
        .navigationTitle("Choose Store")
        .navigationBarTitleDisplayMode(.inline)
    }
}
//
//#Preview {
//    StoresView()
//}
