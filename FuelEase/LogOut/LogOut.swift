import SwiftUI

struct LogOut: View {
    var body: some View {
            ZStack{
                Color(.background).edgesIgnoringSafeArea(.all)
                
                
                Image("Image") // Assuming you have "Logo.png" in your project
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 185)
                    .offset(x: 5, y: 33)
                    .padding(.bottom, 640)
                    
            
            Rectangle()
            .frame(width: 400, height: 600)
            .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
            .cornerRadius(63)
            .overlay(
            RoundedRectangle(cornerRadius: 64)
            .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 4))
            .frame(height: 693)
            .padding(.top, 230)
               
            VStack(spacing: 30) {
                // Thank you and logout messages
                VStack(spacing: 30) {
                    Text("Thank you!")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding(.top, 160)
                    Text("You are successfully Logged out!")
                        .font(.title2)
                        .foregroundColor(.black)
                    }

                    // Login button
                    Button(action: {
                        // Action to handle login
                        print("Login tapped!")
                    }) {
                        Text("Log-in")
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 15)
                            .background(Color.brown)
                            .cornerRadius(25)
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
