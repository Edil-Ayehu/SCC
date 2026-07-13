//
//  ResetPasswordView.swift
//  SCC
//
//  Created by Edil on 12/07/2026.
//

import SwiftUI
import AlertToast

struct ResetPasswordView: View {

    let phoneNumber: String
    @State private var verificationCode = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var isLoading = false
    @State private var isSecure = true
    
    @State private var showSuccessToast: Bool = false

    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var resetPasswordVM = DIContainer.shared.makeResetPasswordViewModel()

    private var isValid: Bool {
        verificationCode.count >= 4 &&
        password.count >= 6
    }

    var body: some View {
        
        VStack {
            
            Spacer()
            AuthHeader(
                title: "Reset Password",
                description: "Create a strong, new password for your account"
            )
            
            Spacer().frame(height: 42)
            
            VStack(spacing: 18) {

                CustomTextField(
                    text: $verificationCode,
                    placeholder: "Verification Code",
                    isRequired: true,
                    prefixIcon: Image(systemName: "number.square")
                )

                PasswordField(
                    title: "New Password",
                    text: $password,
                    isSecure: $isSecure,
                    icon: "lock"
                )

            }
            
            Spacer().frame(height: 38)

            CustomButton(
                title: "Reset Password",
                action: {
                    Task {
                        await resetPasswordVM.resetPassword(
                            phone: phoneNumber,
                            code: verificationCode,
                            newPassword: password
                        )
                    }
                },
                isEnabled: isValid,
                isLoading: resetPasswordVM.isLoading,
            )

            Spacer()
        }
        .padding(.horizontal, 24)
        .onChange(of: resetPasswordVM.successMessage) { _, successMessage in
            if successMessage != nil {
                
                showSuccessToast = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    router.setRoot(.signIn)
                }
                
            }
        }
        
        .toast(isPresenting: $showSuccessToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
//                title: resetPasswordVM.successMessage
                title: resetPasswordVM.successMessage?
                            .replacingOccurrences(
                                of: ". You can now",
                                with: ".\nYou can now"
                            )
            )
        }
        
        .alert(
            "Error",
            isPresented: Binding(
                get: { resetPasswordVM.errorMessage != nil },
                set: { _ in resetPasswordVM.errorMessage = nil }
            )
        ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(resetPasswordVM.errorMessage ?? "Something went wrong.")
        }

    }

}
