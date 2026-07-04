//
//  CartView.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI

struct CartView: View {
    
//    @EnvironmentObject var cartVM: CartViewModel
    
    @StateObject private var cartVM = DIContainer.shared.makeCartViewModel()
    
    @State private var showDialog = false

    var body: some View {
        VStack(spacing: 0) {

            // Header
            HStack {
                Spacer()

                Text("My Cart")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()
                
                if (!cartVM.items.isEmpty) {
                    Button {
                        cartVM.clearCart()
                    } label: {
                        Image(systemName: "trash")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                }

                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            if cartVM.items.isEmpty {
                EmptyCartView()
            } else {
                ScrollView(showsIndicators: false) {

                    LazyVStack(spacing: 18) {

                        ForEach(cartVM.items) { item in
                            CartItemCard(item: item)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 30)

                    Spacer()
                        .frame(height: 40)
                }

            }

            
            Divider()
            
            if (!cartVM.items.isEmpty) {
                HStack(spacing: 16) {
                    
                    CustomButton(
                        title: "Generate Voucher",
                        action: {
                            showDialog = true
                        },
                        height: 42
                    )


                    Button {

                    } label: {
                        Text("Add to Favorite")
                            .font(.custom("Outfit-Medium", size: 16))
                            .foregroundColor(.primaryPurple)
                            .frame(maxWidth: .infinity)
                            .frame(height: 42)
                            .overlay(
                                Capsule()
                                    .stroke(Color.primaryPurple, lineWidth: 1.5)
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
            }

        }
        .environmentObject(cartVM)
        .task {
            cartVM.loadCart()
        }
        .background(Color.white)
        .overlay {
            if showDialog {
                ZStack {
                    // Dark background
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showDialog = false
                        }
                    
                    OrderSuccessDialog(
                        voucherCode: "ABC12345",
                        onDone: {
                            showDialog = false
                            // clear cart
                            cartVM.clearCart()
                        },
                        onCopy: {
                            // implement copy functionality
                        }
                    )
                    .padding(.horizontal, 24)
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: showDialog)
    }
}
