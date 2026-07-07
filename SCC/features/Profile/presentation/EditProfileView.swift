//
//  EditProfileView.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//


import SwiftUI

struct EditProfileView: View {

    @Environment(\.dismiss) private var dismiss

    let profile: ProfileResponse
    
    @State private var fullName: String
    @State private var email = ""
    @State private var phone = ""
    
    init(profile: ProfileResponse) {
        self.profile = profile
        
        _fullName = State(initialValue: profile.name)
        _email = State(initialValue: profile.email ?? "")
        _phone = State(initialValue: profile.phone)
    }

    var body: some View {

        VStack(spacing: 0) {

            // MARK: Navigation

            HStack(spacing: 16) {

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.black)
                }

                Text("Edit Profile")
                    .font(.custom("Outfit-Regular", size: 16))

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

            ScrollView(showsIndicators: false) {

                VStack(spacing: 30) {

                    // MARK: Avatar

                    ZStack(alignment: .bottomTrailing) {

                        Circle()
                            .fill(Color.gray.opacity(0.12))
                            .frame(width: 100, height: 100)
                            .overlay {

                                Image(systemName: "person.fill")
                                    .font(.system(size: 34))
                                    .foregroundColor(.primaryPurple)
                            }

                        Button {

                            // Pick image

                        } label: {

                            Circle()
                                .fill(Color.primaryPurple)
                                .frame(width: 24, height: 24)
                                .overlay {
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 10))
                                        .foregroundColor(.white)
                                }
                        }
                    }
                    .padding(.top, 10)

                    VStack(spacing: 24) {

                        FloatingTextField(
                            title: "Full Name",
                            text: $fullName
                        )

                        FloatingTextField(
                            title: "Email Address",
                            text: $email,
                            keyboardType: .emailAddress
                        )

                        FloatingTextField(
                            title: "Phone Number",
                            text: $phone,
                            keyboardType: .phonePad,
                            isEditable: false
                        )
                    }

                    Spacer(minLength: 150)
                }
                .padding(.horizontal, 20)
            }

            CustomButton(
                title: "Save Changes",
                action: {

                },
                height: 48
            )
            .padding(20)
        }
        .background(Color.white)
        .navigationBarBackButtonHidden()
    }
}

