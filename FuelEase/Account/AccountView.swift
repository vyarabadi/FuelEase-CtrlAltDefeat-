//
//  AccountView.swift
//  FuelEase
//
//  Created by Varshita Yarabadi on 10/26/23.
//

import SwiftUI



struct AccountView: View {
    @ObservedObject private var userManager = UserManager.shared

    @State private var activeSection: HomeView.ActiveSection = .home
    @State private var isEditProfileActive = false

    

    let backgroundColor = Color("BackgroundColor")
    let textColor = Color("TextColor")
    let buttonColor = Color("ButtonColor")
    let borderColor = Color("BorderColor")  


    var body: some View {
        NavigationView {
            TabView(selection: $activeSection) {
                // Account Tab Content
                ZStack {
                    backgroundColor.edgesIgnoringSafeArea(.all)
                    VStack(spacing: -75) {
                        HStack {
                            NavigationLink(
                                destination: Settings(),
                                label: {
                                    Image(systemName: "gear")
                                        .font(.largeTitle)
                                        .padding()
                                        .foregroundColor(textColor)
                                }
                            )
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        VStack(spacing: 45) {
                            RoundedRectangle(cornerRadius: 27)
                                .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
                                .overlay(
                                    VStack {
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .padding(.top, 40)
                                        
                    // made change
                HStack {
                    Text(userManager.currentUser?.firstName ?? "")
                      .font(.custom("AbhayaLibre-SemiBold", size: 22))
                      .padding(.top, 10)
                                            
                    Text(userManager.currentUser?.lastName ?? "")
                       .font(.custom("AbhayaLibre-SemiBold", size: 22))
                       .padding(.top, 10)
                }
                                        
                        // made change
                    Text(userManager.currentUser?.email ?? "")
                        .font(.custom("AbhayaLibre-SemiBold", size: 16 ))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                                        
                
        NavigationLink(destination: EditProfile(), isActive: $isEditProfileActive) {
                EmptyView()
                    }
                                        
        Button(action: {isEditProfileActive = true}) {
            HStack {
            Image(systemName: "pencil")
            Text("Edit Profile")
                .font(.custom("AbhayaLibre-SemiBold", size: 20))}
                .padding(.vertical, 12)
                .padding(.horizontal, 40)
                .background(buttonColor)
                .foregroundColor(textColor)
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                .padding(.top, 70)}
                                        
        Button(action: {}) {
            HStack {
            Image(systemName: "tag")
            Text("View Deals")
            .font(.custom("AbhayaLibre-SemiBold", size: 20))}
            .padding(.vertical, 12)
            .padding(.horizontal, 40)
            .background(buttonColor)
            .foregroundColor(textColor)
            .cornerRadius(25)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
            .padding(.top, 10)}
        
        Spacer()
                                
        Button(action: {}) {
        Text("Log Out")
            .font(.custom("AbhayaLibre-SemiBold", size: 20))
            .padding(.vertical, 12)
            .padding(.horizontal, 40)
            .background(Color("TextColor"))
            .foregroundColor(Color("Color"))}
            .padding(.bottom, 40)})
            .overlay(RoundedRectangle(cornerRadius: 25)
            .stroke(Color("TextColor"), lineWidth: 3))
            .frame(width: 362, height: 633)
            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
            .padding(.top, 100)
    Spacer()
                        }
                    }
                }
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Account")
                    }
                    .tag(HomeView.ActiveSection.home)
                    // Car Tab/searc
                ZStack {
                    Text("Car Tab/ search things") // Placeholder for car content
                    }
                    .tabItem {
                        Image(systemName: "car.fill")
                        Text("Find Gas")
                    }
                    .tag(HomeView.ActiveSection.car)
                    // Clipboard Tab
                    ZStack {
                        Text("Report a gas price") // Placeholder for clipboard content
                    }
                    .tabItem {
                        Image(systemName: "clipboard.fill")
                        Text("Price Log")
                    }
                    .tag(HomeView.ActiveSection.clipboard)
                    // Map Tab
                    ZStack {
                        Text("Map Content") // Placeholder for map content
                    }
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Map")
                    }
                    .tag(HomeView.ActiveSection.map)
                    // Notifications Tab
                    ZStack {
                        Text("Notifications") // Placeholder for notifications content
                    }
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("Notifications")
                    }
                    .tag(HomeView.ActiveSection.bell)
                }

                .onAppear {
                    let appearance = UITabBarAppearance()
                    appearance.backgroundColor = UIColor(named: "ButtonColor")
                    UITabBar.appearance().standardAppearance = appearance
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
                .accentColor(textColor) // To ensure the text and icons use the custom color
            }
            
            .navigationBarBackButtonHidden(true)
        }
    }


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
