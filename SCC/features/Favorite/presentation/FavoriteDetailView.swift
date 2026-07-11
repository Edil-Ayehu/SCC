//
//  FavoriteDetailView.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI
import AlertToast

struct FavoriteDetailView: View {

    @Environment(\.dismiss) private var dismiss

    let favorite: FavoriteResponse
    
    @EnvironmentObject var router: AppRouter
    
    @State private var showDeleteConfirmation: Bool = false
    
    @StateObject var voucherVM = DIContainer.shared.makeVoucherViewModel()
    
    @StateObject var favoriteVM = DIContainer.shared.makeFavoriteViewModel()
    
    @State private var showVoucherGenerateSuccessDialog: Bool = false
    @State private var generatedVoucherCode: String = ""
    
    @State private var showCopyToast = false
    
    @State private var showDeleteToast = false

    var body: some View {

        VStack(spacing: 0) {
            HStack {
                Button {
                    router.pop()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
                
                Text(favorite.name ?? "Favorite items")
                    .font(.custom("Outfit-Medium", size: 16))
                    .foregroundColor(.primary)
                    .padding()
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            
            

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    FavoriteInfoCard(favorite: favorite)

                    LazyVStack(spacing: 24) {

                        ForEach(favorite.items) { product in
                            FavoriteProductRow(product: product)
                        }
                    }
                }
                .padding(20)
            }

            HStack(spacing: 16) {

                CustomButton(
                    title: "Generate Voucher",
                    action: {
                        Task {
                            let cartItems = favorite.items.map(\.asCartItem)
                            await voucherVM.generateVoucher(cartItems: cartItems)
                            
                            if voucherVM.voucher != nil {
                                generatedVoucherCode = voucherVM.voucher!.code
                                showVoucherGenerateSuccessDialog = true
                            }
                        }
                    },
                    isLoading: voucherVM.isLoading,
                    height: 52,
                    
                )

                CustomButton(
                    title: "Delete Favorite",
                    action: {
                        showDeleteConfirmation = true
                    },
                    isLoading: favoriteVM.isDeleting,
                    height: 52,
                    backgroundColor: .red
                )
            }
            .padding(20)
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .alert("Delete Favorite?", isPresented: $showDeleteConfirmation) {
            Button("Cancel", role: .cancel) {}
            
            Button("Delete", role: .destructive) {
                // TODO: Call your delete API
                Task {
                    await favoriteVM.deleteFavorite(id: favorite.id)
                }
                 
            }
        } message: {
            Text("Are you sure you want to delete this favorite? This action cannot be undone.")
                .font(.custom("Outfit-Regular", size: 12))
        }
        .overlay {
            if showVoucherGenerateSuccessDialog {
                ZStack {
                    // Dark background
                    Color.black.opacity(0.6)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showVoucherGenerateSuccessDialog = false
                        }
                    
                    OrderSuccessDialog(
                        voucherCode: generatedVoucherCode,
                        onDone: {
                            showVoucherGenerateSuccessDialog = false
                            // clear cart
                        },
                        onCopy: {
                            // implement copy functionality
                            UIPasteboard.general.string = generatedVoucherCode
                            showCopyToast = true
                            showVoucherGenerateSuccessDialog = false
                        }
                    )
                    .padding(.horizontal, 24)
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: showVoucherGenerateSuccessDialog)
        .toast(isPresenting: $showCopyToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "Voucher code copied"
            )
        }
        
        .onChange(of: favoriteVM.deleteMessage) { _, message in
            guard message != nil else { return }
            
            showDeleteToast = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                dismiss()
            }
        }
        .toast(isPresenting: $showDeleteToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: favoriteVM.deleteMessage
            )
        }

    }
}
