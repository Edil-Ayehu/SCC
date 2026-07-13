//
//  ForgotPasswordView.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var phoneNumber: String = ""
    
    var isValid: Bool {
        phoneNumber.count >= 9
    }
    
    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var forgotPasswordVM = DIContainer.shared.makeForgotPasswordViewModel()
    
    var body: some View {
            VStack(spacing: 24) {

                Spacer()
                
                AuthHeader(
                    title: "Forgot Password",
                    description: "Enter the phone number associated with your account. We will send a secure verification code to reset your password"
                )


                VStack(spacing: 10) {
                    
                    VStack (alignment: .leading) {
                        Text("Phone number")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
                            text: $phoneNumber,
                            placeholder: "Enter phone number",
                            isRequired: true,
                            prefixIcon: Image(systemName: "phone"),
                        )
                    }
                    
                    
                }
                .padding(.top, 16)
                
                Spacer().frame(height: 8)
                
                CustomButton(
                    title: "Send Code",
                    action: {
                        Task {
                            await forgotPasswordVM.sendOTP(phone: phoneNumber)
                            
                        }
                    },
                    isEnabled: isValid,
                    isLoading: forgotPasswordVM.isLoading
                )
                
                Button {
                    router.popToRoot()
                } label: {
                    Text("Back to Login")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primaryPurple)
                }
                
                

                Spacer()
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
            .onChange(of: forgotPasswordVM.successMessage) { _, successMessage in
                if successMessage != nil {
                        router.push(.resetPasswordView(phoneNumber))
                }
            }
            .alert(
                "Error",
                isPresented: Binding(
                    get: { forgotPasswordVM.errorMessage != nil },
                    set: { _ in forgotPasswordVM.errorMessage = nil }
                )
            ) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(forgotPasswordVM.errorMessage ?? "")
            }
    }
    
}

