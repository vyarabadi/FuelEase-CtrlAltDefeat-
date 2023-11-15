//
//  EditProfile.swift
//  FuelEase
//
//  Created by Diya Patel on 11/14/23.
//

import SwiftUI


struct EditProfile: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var primaryLocation = ""
    @State private var email = ""
    @State private var changePassword = ""
    @State private var confirmChangePassword = ""
    @State private var isAccountViewActive = false

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var userManager = UserManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ButtonColor").ignoresSafeArea()
                VStack(spacing: 8) {
                    Spacer()
                    Text("Edit Profile")
                        .font(.custom("AbhayaLibre-ExtraBold", size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 240)
                    
                    FieldWithHeading(heading: "First Name:", placeholder: "Edit your first name", text: $firstName)

                    FieldWithHeading(heading: "Last Name:", placeholder: "Edit your last name", text: $lastName)

                    FieldWithHeading(heading: "Phone Number:", placeholder: "Edit your phone number", text: $phoneNumber, keyboardType: .numberPad)

                    FieldWithHeading(heading: "Primary Location:", placeholder: "Edit your primary location", text: $primaryLocation)

                    FieldWithHeading(heading: "Email:", placeholder: "Edit your email", text: $email, keyboardType: .emailAddress)

                    FieldWithHeading(heading: "Change Password:", placeholder: "Enter your new password", text: $changePassword, isSecure: true)

                    FieldWithHeading(heading: "Change Confirm Password:", placeholder: "Confirm your new password", text: $confirmChangePassword, isSecure: true)

                        Spacer()
                    
                    Button(action: {
                    // Perform validation and update the user information
                    let updatedUser = User(
                        userId: userManager.currentUser?.userId ?? "",
                        firstName: firstName,
                        lastName: lastName,
                        phoneNumber: phoneNumber,
                        primaryLocation: primaryLocation,
                        email: email,
                        password: ""
                    )

                  // Update user information in the shared UserManager
                  userManager.updateUser(updatedUser)
                 // Dismiss the EditProfile view
                  presentationMode.wrappedValue.dismiss()}) {
                  Text("Save Changes")
                    .foregroundColor(Color("Color"))
                    .font(.custom("AbhayaLibre-SemiBold", size: 20))
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 10.0)
                    .background(Color("TextColor"))
                    .cornerRadius(25)
                }
                    
                    
                NavigationLink(
                    destination: AccountView(),
                    label: {
                        Text("Back to Account")
                            .foregroundColor(Color("Color"))
                            .font(.custom("AbhayaLibre-SemiBold", size: 20))
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 10.0)
                            .background(Color("TextColor"))
                            .cornerRadius(25)
                    })
                            .padding(.bottom, 20)
                    }
                
                    .padding(.top, -230)
                    .frame(width: 340.0)
                    .frame(height: 760)
                    .padding(.bottom, -40)
                    .background(RoundedRectangle(cornerRadius: 35)
                        .foregroundColor(Color("Color"))
                        .overlay(RoundedRectangle(cornerRadius: 35)
                            .stroke(Color("TextColor"), lineWidth: 3))
                    )
                                }
                            }
                        }
                    }




                    // Preview
                    struct EditProfile_Previews: PreviewProvider {
                        static var previews: some View {
                            EditProfile()
                        }
                    }
