//
//  ChangePasswordView.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

import SwiftUI

struct ChangePasswordView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""

    @State private var showOldPassword = false
    @State private var showNewPassword = false
    @State private var showConfirmPassword = false

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
                    .font(.custom("Outfit-Regular", size: 16))

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
                            isSecure: !showOldPassword,
                            icon: "lock",
                            onToggleVisibility: {
                                showOldPassword.toggle()
                            }
                        )

                        PasswordField(
                            title: "New Password",
                            text: $newPassword,
                            isSecure: !showNewPassword,
                            icon: "lock.rotation",
                            onToggleVisibility: {
                                showNewPassword.toggle()
                            }
                        )

                        PasswordField(
                            title: "Confirm Password",
                            text: $confirmPassword,
                            isSecure: !showConfirmPassword,
                            icon: "lock.open",
                            onToggleVisibility: {
                                showConfirmPassword.toggle()
                            }
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
                    print("Password changed successfully!")
                },
                height: 48
            )
            .padding(20)
        }
        .navigationBarBackButtonHidden()
        .background(Color.white)
    }
}


