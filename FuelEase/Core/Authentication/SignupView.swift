import SwiftUI

struct Signup: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var primaryLocation = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isFormValid = false
    @State private var isSignUpSuccessful = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("ButtonColor").ignoresSafeArea()
                
                VStack(spacing: 8.0) {
                    Spacer()
                    Text("Sign Up")
                        .font(.custom("AbhayaLibre-ExtraBold", size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 240)
                    
                    FieldWithHeading(heading: "First Name:", placeholder: "Enter your first name", text: $firstName)
                    FieldWithHeading(heading: "Last Name:", placeholder: "Enter your last name", text: $lastName)
                    FieldWithHeading(heading: "Phone Number:", placeholder: "Enter your phone number", text: $phoneNumber, keyboardType: .numberPad)
                    FieldWithHeading(heading: "Primary Location:", placeholder: "Enter your primary location", text: $primaryLocation)
                    FieldWithHeading(heading: "Email:", placeholder: "Enter your email", text: $email, keyboardType: .emailAddress)
                    FieldWithHeading(heading: "Password:", placeholder: "Enter your password", text: $password, isSecure: true)
                    FieldWithHeading(heading: "Confirm Password:", placeholder: "Confirm your password", text: $confirmPassword, isSecure: true)
                    
                    Spacer()
                    Button(action: signUp) {
                        Text("Sign Up")
                            .foregroundColor(Color("Color"))
                            .font(.custom("AbhayaLibre-SemiBold", size: 24))
                            .padding(.horizontal, 45.0)
                            .padding(.vertical, 12.0)
                            .background(Color("TextColor"))
                            .cornerRadius(25)
                    }
                    Spacer()
                    
                    if isFormValid {
                        Text("Fill in all the fields")
                            .foregroundColor(.red)
                            .font(.subheadline)
                    }
                }
                .padding(.top, -240)
                .frame(width: 340.0)
                .background(RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("Color"))
                    .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(Color("TextColor"), lineWidth: 3))
                )
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Sign Up"), message: Text(alertMessage), dismissButton: .default(Text("OK"))
                    )
                }
                NavigationLink(destination: Login(), isActive: $isSignUpSuccessful) {
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func signUp() {
            if firstName.isEmpty || lastName.isEmpty || !isValidPhoneNumber(phoneNumber) || !isValidEmail(email) || password.isEmpty || confirmPassword.isEmpty {
                alertMessage = "Fill in all the fields and check the formats of phone number and email."
                showingAlert = true
                isFormValid = true
            } else if password == confirmPassword {
                let user = User(userId: "", firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, primaryLocation: primaryLocation, email: email, password: password)
                AuthenticationManager.shared.createUser(user: user) { result in
                    switch result {
                    case .success(let newUser):
                        alertMessage = "Registration successful!"
                        showingAlert = true
                        isFormValid = false

                        // Navigate to the login page upon successful sign-up
                        isSignUpSuccessful = true

                        // You can access newUser.userId and other properties if needed
                    case .failure(let error):
                        alertMessage = "An error occurred: \(error.localizedDescription)"
                        showingAlert = true
                        isFormValid = true
                    }
                }
            } else {
                alertMessage = "Passwords do not match. Please try again."
                showingAlert = true
                isFormValid = false
            }
        }
    func isValidPhoneNumber(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct FieldWithHeading: View {
    var heading: String
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(heading)
                .font(.custom("AbhayaLibre-Bold", size: 20))
                .foregroundColor(Color("TextColor"))
                .font(.caption)
                .lineLimit(nil)
            if isSecure {
                SecureField(placeholder, text: $text)
                    .frame(width: 250, height: 6)
                    .font(.custom("AbhayaLibre-SemiBold", size: 20))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("TextColor"), lineWidth: 1)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .font(.custom("AbhayaLibre-SemiBold", size: 20))
                    .frame(width: 250, height: 6)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("TextColor"), lineWidth: 1)
                    )
            }
        }
    }
}

#Preview {
    Signup()
}
