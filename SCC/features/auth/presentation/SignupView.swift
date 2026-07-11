//
//  SignupView.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI
import AlertToast

struct SignupView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var createPassword = ""
    @State private var confirmPassword = ""
    
    @State private var showToast: Bool = false
    @State private var toastMessage: String = ""
    
    var isValid: Bool {
        fullName.count > 2 && email.contains("@") && phoneNumber.count == 10 && createPassword.count >= 6  && createPassword == confirmPassword
    }
    
    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var vm = DIContainer.shared.makeSignUpViewModel()

    var body: some View {
            VStack(spacing: 24) {

                Spacer()
                
                AuthHeader(
                    title: "Sign Up",
                    description: "Sign up to SCC to access your account and start exploring the world of SCC"
                )

                VStack(spacing: 16) {
                    
                    VStack (alignment: .leading) {
                        Text("Full name")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
//                            text: $fullName,
                            text: $vm.name,
                            placeholder: "Enter full name",
                            isRequired: true,
                            prefixIcon: Image(systemName: "phone"),
                        )
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Email")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
//                            text: $email,
                            text: $vm.email,
                            placeholder: "Enter email",
                            isRequired: true,
                            prefixIcon: Image(systemName: "phone"),
                        )
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Phone number")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
//                            text: $phoneNumber,
                            text: $vm.phone,
                            placeholder: "Enter phone number",
                            isRequired: true,
                            prefixIcon: Image(systemName: "phone"),
                        )
                    }
                    
                    
                    
                    VStack (alignment: .leading) {
                        Text("Create password")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
//                            text: $createPassword,
                            text: $vm.password,
                            placeholder: "create password",
                            isRequired: true,
                            isPassword: true,
                            prefixIcon: Image(systemName: "lock"),
                        )
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Confirm password")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
                            text: $confirmPassword,
                            placeholder: "confirm password",
                            isRequired: true,
                            isPassword: true,
                            prefixIcon: Image(systemName: "lock"),
                        )
                    }
                    
                    
                    
                }
                .padding(.top, 16)
                
                Spacer().frame(height: 4)
                
                CustomButton(
                    title: "Continue",
//                    action: _handleSignUP,
                    action: {
                        print("👋Continue Tapped")
                        Task {
                            await vm.register()
                        }
                    },
                    isEnabled: vm.phone.count >= 9 && vm.password.count >= 6 && vm.password == confirmPassword && vm.name.count > 3,
                    isLoading: vm.isLoading,
                )
                
                Button {
                    router.popToRoot()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        
                        Text("Sign In")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.primaryPurple)
                    }
                    
                }


                Spacer()
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
            .onChange(of: vm.errorMessage) {_, error in
                if let error {
                    print("😭Error message:" + error)
                    // show an alert or toast here
                    showToast = true
                    toastMessage = error
                }
            }
            .onChange(of: vm.isLoggedIn) {_, isLoggedIn in
                router.pop()
                print("👋👋👋👋 Sign Up Successful!")
            }
            .toast(isPresenting: $showToast, duration: 2, tapToDismiss: true) {
                AlertToast(
                    displayMode: .hud,
                    type: .error(.red),
                    title: toastMessage
                )
            } onTap: {
                showToast = false
            } completion: {
                showToast = false
            }
    }
}


