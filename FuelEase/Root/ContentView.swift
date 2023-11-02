import SwiftUI

struct ContentView: View {
    @State private var animateLogo = false

    var body: some View {
        NavigationView{
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()

                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)
                        .frame(width: 300.0, height: 300.0)
                        .offset(y: animateLogo ? -20 : 0) // Offset animation
                        .onAppear() {
                            withAnimation(
                                Animation.easeInOut(duration: 1.0)
                                    .repeatCount(1, autoreverses: true) // Bounce animation just once
                            ) {
                                animateLogo.toggle()
                            }
                        }

                    HStack {
                        NavigationLink(destination: Signup()) {
                            Text("Sign Up")
                                .foregroundColor(Color("TextColor"))
                                .font(.custom("AbhayaLibre-Bold", size: 20))
                                .padding()
                                .background(Color("Color"))
                                .cornerRadius(25)
                        }

                        NavigationLink(destination: Login()) {
                            Text("Login")
                                .font(.custom("AbhayaLibre-Bold", size: 20))
                                .foregroundColor(Color("TextColor"))
                                .padding()
                                .background(Color("Color"))
                                .cornerRadius(25)
                        }
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}

#Preview{
    ContentView()
}
