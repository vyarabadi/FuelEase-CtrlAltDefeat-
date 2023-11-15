
import SwiftUI

struct AccountView: View {
    @State private var activeSection: HomeView.ActiveSection = .home
    @State private var isLoggedOut: Bool = false
    @State private var logoutError: Bool = false
    
    let backgroundColor = Color("BackgroundColor") // Replace with your color asset name
    let textColor = Color("TextColor") // Replace with your color asset name
    let buttonColor = Color("ButtonColor") // Replace with your color asset name
    let borderColor = Color("BorderColor") // Replace with your color asset name, if different
    
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
                                        
                                        Text("Niner Norm")
                                            .font(.custom("AbhayaLibre-SemiBold", size: 22))
                                            .padding(.top, 10)
                                        
                                        Text("Ninernorm@uncc.edu")
                                            .font(.custom("AbhayaLibre-SemiBold", size: 16 ))
                                            .foregroundColor(.black)
                                            .padding(.top, 5)
                                        
                                        //buttons and other views
                                        Button(action: {}) {
                                            HStack {
                                                Image(systemName: "pencil")
                                                Text("Edit Profile")
                                                    .font(.custom("AbhayaLibre-SemiBold", size: 20))
                                            }
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 40)
                                            .background(buttonColor)
                                            .foregroundColor(textColor)
                                            .cornerRadius(25)
                                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                                            .padding(.top, 70)
                                        }
                                        
                                        Button(action: {}) {
                                            HStack {
                                                Image(systemName: "tag")
                                                Text("View Deals")
                                                    .font(.custom("AbhayaLibre-SemiBold", size: 20)) // Use the custom font
                                            }
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 40)
                                            .background(buttonColor)
                                            .foregroundColor(textColor)
                                            .cornerRadius(25)
                                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                                            .padding(.top, 10)
                                        }
                                        Spacer()
                                        NavigationLink(destination: LogOutView(), isActive: $isLoggedOut) {
                                                       EmptyView()
                                                   }
                                        Button(action: {
                                            LogoutManager.shared.logout { result in
                                                switch result {
                                                case .success:
                                                    print("User logged out successfully")
                                                    isLoggedOut = true
                                                case .failure:
                                                    // Handle logout failure
                                                    print("Logout failed: try again")
                                                }
                                            }
                                        }) {
                                            Text("Log Out")
                                                .font(.custom("AbhayaLibre-SemiBold", size: 22))
                                                .padding(.vertical, 12)
                                                .padding(.horizontal, 40)
                                                .cornerRadius(25)
                                                .background(Color("TextColor"))
                                                .foregroundColor(Color("Color"))
                                            
                                        }
                                        .cornerRadius(25)
                                        .padding(.bottom, 55)
                                        .alert(isPresented: $logoutError) {
                                            Alert(
                                                title: Text("Logout Failed"),
                                                message: Text("Logout failed, please try again."),
                                                dismissButton: .default(Text("OK"))
                                            )
                                        }
                                        
                                    }
                                )
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
                
                // Car Tab/search
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
