//
//  ChangePasswordView.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

import SwiftUI
import AlertToast

struct ChangePasswordView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""

    @State private var oldPasswordSecure = true
    @State private var newPasswordSecure = true
    @State private var confirmPasswordSecure = true
    
    @State private var isSecure = true
    
    @State private var showToast = false
    
    @StateObject var profileVM =  DIContainer.shared.makeProfileViewModel()
        
    
    var body: some View {

        VStack(spacing: 0) {

            // MARK: Navigation Bar

            HStack(spacing: 16) {

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.black)
                }

                Text("Change Password")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 28) {

                    VStack(alignment: .leading, spacing: 8) {

                        Text("Update Your Password")
                            .font(.custom("Outfit-Medium", size: 18))

                        Text("Choose a strong password to keep your account secure.")
                            .font(.custom("Outfit-Regular", size: 14))
                            .foregroundColor(.gray)
                    }

                    VStack(spacing: 18) {

                        PasswordField(
                            title: "Old Password",
                            text: $oldPassword,
                            isSecure: $oldPasswordSecure,
                            icon: "lock"
                        )

                        PasswordField(
                            title: "New Password",
                            text: $newPassword,
                            isSecure: $newPasswordSecure,
                            icon: "lock.rotation"
                        )

                        PasswordField(
                            title: "Confirm Password",
                            text: $confirmPassword,
                            isSecure: $confirmPasswordSecure,
                            icon: "lock.open"
                        )
                    }

                    Spacer(minLength: 150)
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
            }

            CustomButton(
                title: "Change Password",
                action: {
                    guard !oldPassword.isEmpty,
                          !newPassword.isEmpty,
                          !confirmPassword.isEmpty else {
                        profileVM.errorMessage = "Please fill in all fields."
                        return
                    }
                    
                    guard newPassword == confirmPassword else {
                        profileVM.errorMessage = "Passwords do not match."
                        return
                    }
                    
                    Task {
                        await profileVM.changePassword(
                            oldPassword: oldPassword,
                            newPassword: newPassword
                        )
                    }
                },
                isLoading: profileVM.isLoading,
                height: 48
            )
            .padding(20)
        }
        .navigationBarBackButtonHidden()
        .background(Color.white)
        .onChange(of: profileVM.successMessage) { _, message in
            guard message != nil else { return }
            
            showToast = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                dismiss()
            }
        }
        .toast(isPresenting: $showToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: profileVM.successMessage
            )
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: { profileVM.errorMessage != nil},
                set: { _ in profileVM.errorMessage = nil}
            )
        ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(profileVM.errorMessage ?? "Something went wrong!")
                .font(.custom("Outfit-Regular", size: 12))
        }
    }
}


