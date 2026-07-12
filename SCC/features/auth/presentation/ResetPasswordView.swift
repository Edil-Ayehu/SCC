//
//  ResetPasswordView.swift
//  SCC
//
//  Created by Edil on 12/07/2026.
//

import SwiftUI

struct ResetPasswordView: View {

    let phoneNumber: String
    @State private var verificationCode = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var isLoading = false
    @State private var isSecure = true

    @EnvironmentObject private var router: AppRouter

    private var isValid: Bool {
        verificationCode.count >= 4 &&
        password.count >= 8
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
                action: resetPassword,
                isEnabled: isValid,
                isLoading: isLoading,
            )

            Spacer()
        }
        .padding(.horizontal, 24)

//        ZStack(alignment: .top) {
//
//            Color(.systemGray6)
//                .ignoresSafeArea()
//
//            VStack(spacing: 0) {
//
//                // Header
//                AuthHeader(
//                    title: "Reset Password",
//                    description: "Create a strong, new password for your account"
//                )
//
//                Spacer()
//                
//                
//            }
//
//            VStack {
//
//                Spacer().frame(height: 185)
//
//                VStack(spacing: 22) {
//
//                    ZStack {
//                        Circle()
//                            .fill(Color.cyan.opacity(0.15))
//                            .frame(width: 90, height: 90)
//
//                        Image(systemName: "shield.fill")
//                            .font(.system(size: 38))
//                            .foregroundColor(.cyan)
//                    }
//
//                    VStack(spacing: 18) {
//
//                        CustomTextField(
//                            text: $verificationCode,
//                            placeholder: "Verification Code",
//                            isRequired: true,
//                            prefixIcon: Image(systemName: "number.square")
//                        )
//
//                        PasswordField(
//                            title: "New Password",
//                            text: $password,
//                            isSecure: $isSecure,
//                            icon: "lock"
//                        )
//
//                    }
//
//                    CustomButton(
//                        title: "Reset Password",
//                        action: resetPassword,
//                        isEnabled: isValid,
//                        isLoading: isLoading
//                    )
//
//                }
//                .padding(24)
//                .background(Color.white)
//                .clipShape(RoundedRectangle(cornerRadius: 28))
//                .shadow(color: .black.opacity(0.08),
//                        radius: 18,
//                        y: 8)
//                .padding(.horizontal, 24)
//
//                Spacer()
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .background(.white)
    }

    private func resetPassword() {

        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            isLoading = false

            print("Verification Code:", verificationCode)
            print("New Password:", password)

            router.popToRoot()
        }
    }
}
