import SwiftUI

struct SignInView: View {
    @State private var phoneNumber = "0930884402"
    @State private var password = "123456"
    @State private var _isLoading: Bool = false
    
    var isValid: Bool {
        phoneNumber.count >= 10 && password.count >= 6
    }
    
    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var vm = DIContainer.shared.makeSignInViewModel()

    var body: some View {
            VStack(spacing: 24) {

                Spacer()
                
                AuthHeader(
                    title: "Sign In",
                    description: "Sign in with your email address and phone number"
                )


                VStack(spacing: 16) {
                    
                    CustomTextField(
//                        text: $phoneNumber,
                        text: $vm.phoneNumber,
                        placeholder: "Enter phone number",
                        label: "Phone number",
                        isRequired: true,
                        prefixIcon: Image(systemName: "phone"),
                    )
                    
                    
                    CustomTextField(
//                        text: $password,
                        text: $vm.password,
                        placeholder: "Enter password",
                        label: "Password",
                        isRequired: true,
                        isPassword: true,
                        prefixIcon: Image(systemName: "lock"),
                    )
                    
                    
                    
                }
                .padding(.top, 16)
                
                HStack {
                    Spacer()
                    
                    Button {
                        // handle navigation to forgot password screen
                        router.push(.forgotPassword)
                    } label: {
                        Text("Forgot Password?")
                            .font(.custom("Outfit-SemiBold", size: 16))
                            .foregroundColor(.primaryPurple)
                    }
                }
                
                
                
                Spacer().frame(height: 8)
                
                CustomButton(
                    title: "Continue",
//                    action: _handleSignIn,
                    action: {
                        Task {
                            await vm.login()
                        }
                    },
                    isEnabled: vm.phoneNumber.count >= 9 && vm.password.count >= 6,
                    isLoading: vm.isLoading,
                    height: 52
                )
                
                Button {
                    router.push(.signUp)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.custom("Outfit-Regular", size: 16))
                            .foregroundColor(.black)
                        
                        Text("Sign Up")
                            .font(.custom("Outfit-SemiBold", size: 16))
                            .foregroundColor(.primaryPurple)
                    }
                    
                }
                
                

                Spacer()
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
            .onChange(of: vm.errorMessage) {error in
                if let error {
                    print(error)
                        // show an alert or toast here
                }
            }
            .onChange(of: vm.isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    router.setRoot(.home)
                    print("👋👋👋👋 Sign In Successful!")
                }
                
            }
    }
    
//    func _handleSignIn() {
//        _isLoading = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//            print("Phone number: " + phoneNumber)
//            print("Sign In Successful!")
//            _isLoading = false
//            router.setRoot(.home)
//        })
//    }
}

//#Preview {
//    SignInView()
//}
