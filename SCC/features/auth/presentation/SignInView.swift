import SwiftUI

struct SignInView: View {
    @State private var phoneNumber = "0930884402"
    @State private var password = "123456"
    @State private var _isLoading: Bool = false
    
    var isValid: Bool {
        phoneNumber.count >= 10 && password.count >= 6
    }
    
    @EnvironmentObject private var router: AppRouter

    var body: some View {
            VStack(spacing: 24) {

                Spacer()
                
                AuthHeader(
                    title: "Sign In",
                    description: "Sign in with your email address and phone number"
                )


                VStack(spacing: 16) {
                    
                    VStack (alignment: .leading) {
                        Text("Phone number")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
                            text: $phoneNumber,
                            placeholder: "Enter phone number",
                            isRequired: true,
                            prefixIcon: Image(systemName: "phone"),
                        )
                    }
                    
                    
                    
                    VStack (alignment: .leading) {
                        Text("Password")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        CustomTextField(
                            text: $password,
                            placeholder: "Enter password",
                            isRequired: true,
                            isPassword: true,
                            prefixIcon: Image(systemName: "lock"),
                        )
                    }
                    
                    
                    
                }
                .padding(.top, 16)
                
                HStack {
                    Spacer()
                    
                    Button {
                        // handle navigation to forgot password screen
                        router.push(.forgotPassword)
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.primaryPurple)
                    }
                }
                
                
                
                Spacer().frame(height: 8)
                
                CustomButton(
                    title: "Continue",
                    action: _handleSignIn,
                    isEnabled: isValid,
                    isLoading: _isLoading
                )
                
                Button {
                    // handle click | navigate to signup screen
                    router.push(.signUp)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        
                        Text("Sign Up")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.primaryPurple)
                    }
                    
                }
                
                

                Spacer()
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
    }
    
    func _handleSignIn() {
        _isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            print("Phone number: " + phoneNumber)
            print("Sign In Successful!")
            _isLoading = false
            router.setRoot(.home)
        })
    }
}

//#Preview {
//    SignInView()
//}
