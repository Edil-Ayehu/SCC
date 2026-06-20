//
//  ContentView.swift
//  SCC
//
//  Created by Edil on 17/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    Rectangle()
                        .background(Color.red)
                        .frame(width: 300, height: 200)
                        .cornerRadius(16)
                        .overlay {
                            VStack {
                                
                                Image("inactive_card")
                                    .resizable()
                            }
                        }
                        
                }
                .padding()
            }
        }
        .navigationTitle("Closed Cards")
        
    }
}

//#Preview {
//    ContentView()
//}
