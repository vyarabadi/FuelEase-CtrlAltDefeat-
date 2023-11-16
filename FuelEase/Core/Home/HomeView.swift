import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            // Home Tab
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        NavigationLink(
                            destination: Settings(),
                            label: {
                                Image(systemName: "gear")
                                    .font(.largeTitle)
                                    .padding()
                                    .foregroundColor(.text)
                            }
                        )
                        Spacer()
                        NavigationLink(
                            destination: AccountView(),
                            label: {
                                Image(systemName: "person.circle")
                                    .font(.largeTitle)
                                    .padding()
                                    .foregroundColor(.text)
                            }
                        )
                    }
                    Spacer()
                    Text("My Home")
                        .font(.custom("AbhayaLibre-ExtraBold", size: 55))
                        .foregroundColor(Color("TextColor"))
                        .padding(.bottom, 20)
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Find cheap gas now")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                            .padding()
                            .padding(.horizontal, 10)
                            .foregroundColor(Color.text)
                            .shadow(radius: 5)
                            .background(
                                Capsule()
                                    .stroke(Color.text, lineWidth: 6.0)
                                    .fill(Color.button)
                                    .shadow(radius: 5)
                            )
                    }
                    //.offset(x:0, y:-230)
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: PriceReportView()) {
                        Text("Report gas price")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                            .padding()
                            .padding(.horizontal, 30)
                            .foregroundColor(Color.text)
                            .background(
                                Capsule()
                                    .stroke(Color.text, lineWidth: 6.0)
                                    .fill(Color.button)
                            )
                            .shadow(radius: 5)
                    }
                    //.offset(x:0, y:-200)
                    .padding(.bottom, 300)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

