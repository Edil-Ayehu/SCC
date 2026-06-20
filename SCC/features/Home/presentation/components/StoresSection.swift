//
//  StoresSection.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//

import SwiftUI

struct StoresSection: View {

    let stores = [
        Store(name: "Zoe Cash & Carry", image: "store"),
        Store(name: "Test Store 19", image: "store2"),
        Store(name: "Fresh Market", image: "store3"),
        Store(name: "Downtown Grocery", image: "store4")
    ]

    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {

                Text("Stores Near You")
                    .font(.system(size: 18, weight: .bold, design: .default))

                Spacer()

                Button("See All") {

                }
                .fontWeight(.semibold)
            }
            .padding(.horizontal, 20)

            LazyVGrid(columns: columns, spacing: 16) {

                ForEach(stores) { store in
                    StoreCard(store: store)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer().frame(height: 10)
        }
    }
}
