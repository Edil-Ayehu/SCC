import SwiftUI
import AlertToast

struct SignInView: View {

    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var vm = DIContainer.shared.makeSignInViewModel()
    
    @State private var showToast = false
    @State private var toastMessage = ""
    

    var body: some View {
            VStack(spacing: 24) {

                Spacer()
                
                AuthHeader(
                    title: "Sign In",
                    description: "Sign in with your email address and phone number"
                )


                VStack(spacing: 16) {
                    
                    CustomTextField(
                        text: $vm.phoneNumber,
                        placeholder: "Enter phone number",
                        label: "Phone number",
                        isRequired: true,
                        prefixIcon: Image(systemName: "phone"),
                    )
                    
                    
                    CustomTextField(
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
                    showToast = true
                    toastMessage = error
                    
                }
            }
            .onChange(of: vm.isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    router.setRoot(.home)
                    print("👋👋👋👋 Sign In Successful!")
                }
                
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

