//
//  ProfileView.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var vm: ProfileViewModel

    var body: some View {
        

        VStack(spacing: 0) {

            // MARK: Header

            Text("Profile")
                .font(.custom("Outfit-SemiBold", size: 20))
                .padding(.top, 20)

            ScrollView(showsIndicators: false) {

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

                            Text(vm.profile!.name)
                                .font(.custom("Outfit-Medium", size: 20))
                            
                            if (vm.profile!.email != nil) {
                                Text(vm.profile!.email!)
                                    .font(.custom("Outfit-Regular", size: 14))
                                    .foregroundColor(.gray)
                            }

                            
                        }

                        HStack(spacing: 8) {

                            Image(systemName: vm.profile!.isActive ? "checkmark.circle.fill" : "chevron.compact.down")
                                .foregroundColor(.green)
                            
                            

                            Text(vm.profile!.isActive ? "Active Customer" : "InActive Customer")
                                .font(.custom("Outfit-Medium", size: 15))
                                .foregroundColor(vm.profile!.isActive ? .green : .orange)
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(vm.profile!.isActive ? Color.green.opacity(0.12): Color.orange.opacity(0.12))
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
                            value: vm.profile!.updatedAt.formattedDate()
                        )
                    }

                    // MARK: Preferences

                    VStack(alignment: .leading, spacing: 18) {

                        Text("Preferences")
                            .font(.custom("Outfit-Medium", size: 16))

                        Button {

                        } label: {

                            HStack {

                                Image(systemName: "pencil")
                                    .font(.system(size: 18))
                                    .foregroundColor(.primaryPurple)
                                    .frame(width: 28)

                                Text("Edit Profile")
                                    .font(.custom("Outfit-Regular", size: 16))
                                    .foregroundColor(.black)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 10)
                        }
                        
                        Button {

                        } label: {

                            HStack {

                                Image(systemName: "lock")
                                    .font(.system(size: 18))
                                    .foregroundColor(.primaryPurple)
                                    .frame(width: 28)

                                Text("Change Password")
                                    .font(.custom("Outfit-Regular", size: 16))
                                    .foregroundColor(.black)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 10)
                        }
                    }

                    Spacer(minLength: 20)

                    // MARK: Logout

                    Button {

                    } label: {

                        Text("Logout")
                            .font(.custom("Outfit-Medium", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 58)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(red: 1.0, green: 0.34, blue: 0.36),
                                        Color.red
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(Capsule())
                    }
                }
                .padding(24)
            }
        }
        .background(Color.white)
//        .task {
//            await profileVM.loadProfile()
//        }
    }
}

