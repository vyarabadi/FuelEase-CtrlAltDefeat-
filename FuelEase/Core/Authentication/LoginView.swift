import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isEmailValid: Bool = true
    @State private var isLoginSuccessful: Bool = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                
                VStack(spacing: 35.0) {
                    Text("Login")
                        .font(.custom("AbhayaLibre-ExtraBold", size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 80)
                    
                    TextField("Email", text: $email)
                        .font(.custom("AbhayaLibre-Bold", size: 20))
                        .frame(width: 260, height: 10)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(isEmailValid ? Color("TextColor") : Color.red, lineWidth: 2)
                        )
                        .onChange(of: email) { _ in
                            isEmailValid = isValidEmail(email)
                        }
                    
                    SecureField("Password", text: $password)
                        .font(.custom("AbhayaLibre-Bold", size: 20))
                        .frame(width: 260, height: 10)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("TextColor"), lineWidth: 2)
                        )
                    
                    if !isEmailValid {
                        Text("Please enter a valid email.")
                            .font(.custom("AbhayaLibre-Bold", size: 16))
                            .foregroundColor(Color.red)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: Signup()) {
                        Text("New User? ")
                            .foregroundColor(Color("TextColor"))
                            .font(.custom("AbhayaLibre-Bold", size: 16))
                        +
                        Text("Create an account")
                            .bold()
                            .font(.custom("AbhayaLibre-Bold", size: 16))
                            .underline()
                            .foregroundColor(Color("TextColor"))
                    }
                    
                    Button(action: {
                        login()
                    }) {
                        Text("Login")
                            .foregroundColor(Color("Color"))
                            .font(.custom("AbhayaLibre-Bold", size: 26))
                            .padding(.horizontal, 45.0)
                            .padding(.vertical, 10.0)
                            .background(Color("TextColor"))
                            .cornerRadius(50)
                    }
                    Spacer()
                    if isLoginSuccessful {
                        NavigationLink(
                            destination: HomeView(),
                            isActive: $isLoginSuccessful,
                            label: {
                                EmptyView()
                            }
                        )
                    }
                }
                .padding()
                .frame(width: 340.0, height: 500.0)
                .background(RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("Color"))
                    .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(Color("TextColor"), lineWidth: 3)))
                
                HStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200.0, height: 200.0)
                }
                .padding(.top, -380)
            }
        }.navigationBarBackButtonHidden(true)
    }
    func login() {
        LoginManager.shared.login(email: email, password: password) { result in
            switch result {
            case .success:
                isLoginSuccessful = true
            case .failure:
                errorMessage = "Email or password doesn't match our records"
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0.9.-]+.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}

#Preview {
    Login()
}

