import SwiftUI

struct LogOut: View {
    var body: some View {
            ZStack{
                Color("ButtonColor").ignoresSafeArea()
                
                HStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150.0, height: 200.0)
                }
                .padding(.top, -380)
                    
            
            Rectangle()
            .frame(width: 395, height: 600)
            .foregroundColor(Color("Color"))
            .cornerRadius(63)
            .overlay(
            RoundedRectangle(cornerRadius: 64)
            .stroke(Color("TextColor"), lineWidth: 5))
            .frame(height: 693)
            .padding(.top, 230)
               
            VStack(spacing: 30) {
                // Thank you and logout messages
                VStack(spacing: 30) {
                    Text("Thank you!")
                        .font(.custom("AbhayaLibre-ExtraBold", size: 54))
                        .foregroundColor(Color("TextColor"))
                        .padding(.top, 120)
                    Text("You are successfully logged out!")
                        .font(.custom("AbhayaLibre-SemiBold", size: 26))
                        .padding(.top, 30)
                        .foregroundColor(Color("TextColor"))
                    }

                    // Login button
                    Button(action: {
                        // Action to handle login
                        print("Login tapped!")
                    }) {
                        Text("Login")
                            .font(.custom("AbhayaLibre-Bold", size: 26))
                            .foregroundColor(Color("Color"))
                            .padding(.horizontal, 50)
                            .padding(.vertical, 15)
                            .background(Color("TextColor"))
                            .cornerRadius(50)
                            .padding(.top, 90)
                    }
                }
                .padding()
            }
        }
}

#Preview {
    LogOut()
}
