import SwiftUI


struct ContentView: View {
    @State private var activeSection: ActiveSection = .home

    
    enum ActiveSection: String {
        case home, car, clipboard, map, bell
    }
    
    var body: some View {
        NavigationView{
            TabView(selection: $activeSection) {
                
                // Home Tab
                ZStack {
                    Color(.backgound)
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            NavigationLink(
                                destination: Settings(),
                                label: {
                                Image(systemName: "gear")
                                    .font(.largeTitle)
                                    .padding()
                                    .padding(.bottom,40)
                                    .foregroundColor(.text)
                                
                            }
                                )
                            Spacer()
                            Button(action:{
                                print("Account")
                            }){
                                Image(systemName: "person.circle")
                                    .font(.largeTitle)
                                    .padding()
                                    .padding(.bottom, 40)
                                    .foregroundColor(.text)
                            }
                        }
                        Text("My Home")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 55))
                            .foregroundColor(Color("TextColor"))
                            .padding(.bottom,300)
                        
                        Button(action: {
                            self.activeSection = .car
                        }, label: {
                            Text("Find cheap gas now")
                                .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                                .padding()
                                .padding(.horizontal,10)
                                .foregroundColor(Color.text)
                                .shadow(radius: 5)
                                .background(
                                    Capsule()
                                        .stroke(Color.text, lineWidth: 6.0)
                                        .fill(Color.button)
                                        .shadow(radius: 5)
                                )
                        })
                        .offset(x:0, y:-230)
                        
                        Button(action: {
                            self.activeSection = .clipboard
                        }, label: {
                            Text("Report gas price")
                                .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                                .padding()
                                .padding(.horizontal,30)
                                .foregroundColor(Color.text)
                                .shadow(radius: 5)
                                .background(
                                    Capsule()
                                        .stroke(Color.text, lineWidth: 6.0)
                                        .fill(Color.button)
                                        .shadow(radius: 5)
                                )
                        })
                        .offset(x:0, y:-200)
                    }
                }
                //home tab
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(ActiveSection.home)
                // Car Tab/search
                ZStack {
                    Text("Car Tab/ search things") // Placeholder for car content
                }
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Find gas")
                }
                .tag(ActiveSection.car)
                
                ZStack {
                    Text("Report a gas price") // Placeholder for report a gas price content
                }
                .tabItem {
                    Image(systemName: "clipboard.fill")
                    Text("Price Log")
                }
                .tag(ActiveSection.clipboard)
                // Map Tab
                ZStack {
                    Text("Map Content") // Placeholder for map content
                }
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
                .tag(ActiveSection.map)
                
                // Notifications Tab
                ZStack {
                    
                    Text("Notifications") // Placeholder for bell content
                }
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notifications")
                }
                .tag(ActiveSection.bell)
                
            }
            .onAppear(perform: {
                let appearance = UITabBarAppearance()
                appearance.backgroundColor = UIColor(named: "ButtonColor")
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            })
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color("ButtonColor"))
                    .shadow(radius:5))
            
            
            .accentColor(Color("TextColor")) // To ensure the text and icons use custom color
        }
    }
    
    
}
#Preview {
    ContentView()
}
