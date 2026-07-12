//
//  ProfileView.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

import SwiftUI
import Foundation
import AlertToast

struct ProfileView: View {
    
    @EnvironmentObject var vm: ProfileViewModel
    
 
    @EnvironmentObject var router: AppRouter
    
    @State private var showLogoutConfirmationDialog: Bool = false
    
    @StateObject private var authVM = DIContainer.shared.makeLogoutViewModel()

    var body: some View {
        
        VStack(spacing: 0) {

            
            if (vm.isLoading) {
                ProgressView()
                
            } else if let profile = vm.profile {
                ScrollView(showsIndicators: false) {
                    
                    // MARK: Header

                    Text("Profile")
                        .font(.custom("Outfit-SemiBold", size: 20))
                        .padding(.top, 20)

                    VStack(spacing: 30) {

                        // MARK: Profile

                        VStack(spacing: 12) {

                            Circle()
                                .fill(Color.gray.opacity(0.12))
                                .frame(width: 110, height: 110)
                                .overlay {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 42))
                                        .foregroundColor(.primaryPurple)
                                }

                            VStack(spacing: 4) {

                                Text(profile.name)
                                    .font(.custom("Outfit-Medium", size: 20))
                                
                                if (profile.email != nil) {
                                    Text(profile.email!)
                                        .font(.custom("Outfit-Regular", size: 14))
                                        .foregroundColor(.gray)
                                }

                                
                            }

                            HStack(spacing: 8) {

                                Image(systemName: profile.isActive ? "checkmark.circle.fill" : "chevron.compact.down")
                                    .foregroundColor(.green)
                                
                                

                                Text(profile.isActive ? "Active Customer" : "InActive Customer")
                                    .font(.custom("Outfit-Medium", size: 15))
                                    .foregroundColor(vm.profile!.isActive ? .green : .orange)
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .background(profile.isActive ? Color.green.opacity(0.12): Color.orange.opacity(0.12))
                            .clipShape(Capsule())
                        }

                        // MARK: Account Information

                        VStack(alignment: .leading, spacing: 24) {

                            Text("Account Information")
                                .font(.custom("Outfit-Medium", size: 16))

                            ProfileInfoRow(
                                icon: "phone",
                                title: "Phone Number",
                                value: vm.profile!.phone,
                            )

                            ProfileInfoRow(
                                icon: "calendar",
                                title: "Member Since",
                                value: profile.updatedAt.formattedDate()
                            )
                        }

                        // MARK: Preferences

                        VStack(alignment: .leading, spacing: 18) {

                            Text("Preferences")
                                .font(.custom("Outfit-Medium", size: 16))

                            Button {
                                router.push(.editProfileView(profile))
                            } label: {

                                HStack {

                                    Image(systemName: "pencil")
                                        .font(.system(size: 18))
                                        .foregroundColor(.primaryPurple)
                                        .frame(width: 28)

                                    Text("Edit Profile")
                                        .font(.custom("Outfit-Regular", size: 14))
                                        .foregroundColor(.black)

                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 10)
                            }
                            
                            Button {
                                router.push(.changePassword)
                            } label: {

                                HStack {

                                    Image(systemName: "lock")
                                        .font(.system(size: 18))
                                        .foregroundColor(.primaryPurple)
                                        .frame(width: 28)

                                    Text("Change Password")
                                        .font(.custom("Outfit-Regular", size: 14))
                                        .foregroundColor(.black)

                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 10)
                            }
                        }

                        // MARK: Logout
                        
                        CustomButton(
                            title: "Logout",
                            action: {
                                showLogoutConfirmationDialog = true
                            },
                            height: 48,
                            backgroundColor: .red,
                        )

                    }
                    .padding(24)
                }

            } else {
                ContentUnavailableView(
                            "Unable to load profile",
                            systemImage: "person.crop.circle.badge.exclamationmark"
                        )
            }

         }
        .background(Color.white)
        .alert("Logout?", isPresented: $showLogoutConfirmationDialog) {
            Button("Cancel", role: .cancel) {}
            
            Button("Logout", role: .destructive) {
                Task {
                    await authVM.logout()
                }
                
            }
        } message: {
            Text("Are you sure you want to log out of your account?")
                .font(.custom("Outfit-Regular", size: 12))
        }
        .onChange(of: authVM.didLogout) { _, didLogout in
            if didLogout {
                router.setRoot(.signIn)
            }
        }
        
        .overlay {
            if authVM.isLoggingOut {
                ZStack {
                    Color.black.opacity(0.35)
                        .ignoresSafeArea()

                    VStack(spacing: 16) {
                        ProgressView()

                        Text("Signing out...")
                            .font(.custom("Outfit-Medium", size: 16))
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 24)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 12)
                }
            }
        }
        .animation(.easeInOut(duration: 0.2), value: authVM.isLoggingOut)
        
    }
}

