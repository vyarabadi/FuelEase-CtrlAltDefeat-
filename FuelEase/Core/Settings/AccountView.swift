//
//  AccountView.swift
//  FuelEase
//
//  Created by Varshita Yarabadi on 10/26/23.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack(spacing: 0) {
            Color(.background)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
            
            RoundedRectangle(cornerRadius: 63)
                .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
                .overlay(
                    VStack {
                        Spacer()
                            .navigationBarBackButtonHidden(true)
                            .toolbar(content: {
                                ToolbarItem (placement: .navigationBarLeading)  {
                                    
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "arrow.left")
                                        //Image(systemName: "house.fill")
                                            .foregroundColor(Color("TextColor"))
                                        Text("Back")
                                            .foregroundColor(Color("TextColor"))
                                            .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                                        
                                    })
                                    
                                }
                            })
                        
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.top, 40)
                        
                        Text("Niner Norm")
                            .font(.title2)
                            .padding(.top, 10)
                        
                        Text("Ninernorm@uncc.edu")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "pencil")
                                Text("Edit Profile")
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 40)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                            .padding(.top, 20)
                        }
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "tag")
                                Text("View Deals")
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 40)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                            .padding(.top, 10)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Log Out")
                                .foregroundColor(.red)
                        }
                        .padding(.bottom, 40)
                    }
                )
                .overlay(RoundedRectangle(cornerRadius: 63)
                            .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 3))
                .frame(width: 380, height: 620)
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                .padding(.bottom,40)
            
            HStack(spacing: 20) {
                /*Image(systemName: "house")
                Image(systemName: "magnifyingglass")
                Image(systemName: "map")
                Image(systemName: "bell")*/
            }
            .font(.system(size: 24))
            .padding(.top, 20)
            .foregroundColor(Color(red: 0.451, green: 0.235, blue: 0.149))
            
            Spacer()
        }
        .background(Color(.background).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    AccountView()
}
