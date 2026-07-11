//
//  CartView.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI
import UIKit
import AlertToast

struct CartView: View {
        
    @StateObject private var cartVM = DIContainer.shared.makeCartViewModel()
    
    @State private var showDialog = false
    
    @StateObject private var voucherVM = DIContainer.shared.makeVoucherViewModel()
    
    @StateObject private var favoriteVM = DIContainer.shared.makeFavoriteViewModel()
    
    @State private var generatedVoucherCode: String = ""
    
    @State private var showClearCartConfirmation = false
    
    @State private var showCopyToast = false
    
    @State private var showFavoriteSheet = false
    
    @State private var showFavoriteSuccessToast = false
    
    @State private var favoriteName = ""

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
                        showClearCartConfirmation = true
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
                            Task {
                                
                                await voucherVM.generateVoucher(cartItems: cartVM.items)
                                
                                if voucherVM.voucher != nil {
                                    generatedVoucherCode = voucherVM.voucher!.code
                                    showDialog = true
                                }
                            }
                        },
                        isLoading: voucherVM.isLoading,
                        height: 42
                    )


                    Button {
                        showFavoriteSheet = true
                        favoriteName = ""
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
        .toast(isPresenting: $showCopyToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "Voucher code copied"
            )
        }
        .alert("Clear Cart?", isPresented: $showClearCartConfirmation) {
            Button("Cancel", role: .cancel) {}
            
            Button("Clear", role: .destructive) {
                cartVM.clearCart()
            }
        } message: {
            Text("Are you sure you want to remove all items from your cart?")
                .font(.custom("Outfit-Regular", size: 12))
        }
        .overlay {
            if showDialog {
                ZStack {
                    // Dark background
                    Color.black.opacity(0.6)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showDialog = false
                        }
                    
                    OrderSuccessDialog(
                        voucherCode: generatedVoucherCode,
                        onDone: {
                            showDialog = false
                            // clear cart
                            cartVM.clearCart()
                        },
                        onCopy: {
                            // implement copy functionality
                            UIPasteboard.general.string = generatedVoucherCode
                            showCopyToast = true
                            showDialog = false
                            cartVM.clearCart()
                        }
                    )
                    .padding(.horizontal, 24)
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: showDialog)
        
        .sheet(isPresented: $showFavoriteSheet) {
            AddFavoriteSheet(
                favoriteName: $favoriteName,
                isLoading: favoriteVM.isCreating
            ) {

                Task {

                    let request = CreateFavoriteRequest(
                        name: favoriteName.isEmpty ? nil : favoriteName,
                        items: cartVM.items.map {
                            CreateFavoriteItemRequest(
                                productId: $0.product.id,
                                quantity: $0.quantity
                            )
                        }
                    )

                    await favoriteVM.createFavorite(request: request)

                    if favoriteVM.errorMessage == nil {
                        showFavoriteSheet = false
                    }
                }

            } onSkip: {

                Task {

                    let request = CreateFavoriteRequest(
                        name: nil,
                        items: cartVM.items.map {
                            CreateFavoriteItemRequest(
                                productId: $0.product.id,
                                quantity: $0.quantity
                            )
                        }
                    )

                    await favoriteVM.createFavorite(request: request)

                    if favoriteVM.errorMessage == nil {
                        showFavoriteSheet = false
                    }
                }

            }
            .presentationDetents([.height(280)])
            .presentationDragIndicator(.visible)
        }
        .onChange(of: favoriteVM.createSuccessMessage) {_, message in
            if message != nil {
                showFavoriteSuccessToast = true
            }
            
        }
        .toast(isPresenting: $showFavoriteSuccessToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: favoriteVM.createSuccessMessage
            )
        }
    }
}
