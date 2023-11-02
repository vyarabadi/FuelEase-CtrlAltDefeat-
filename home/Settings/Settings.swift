import SwiftUI

struct Settings: View {
    @State private var activeSection: ActiveSection = .Settings
    @State private var isNavigating: Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
 
    enum ActiveSection: String {
        case home, car, clipboard, map, bell, Settings
    }
    
    var body: some View {

            ZStack {
                Color(.backgound) 
                    .ignoresSafeArea()
                
                VStack {
                    // Top gear button
                   /* HStack {
                      
                        Button(action:{
                            print("Settings")
                        }){
                                Image(systemName: "gear")
                                    .font(.largeTitle)
                                    .padding()
                                    .foregroundColor(.text)
                            }
                       
                        Spacer()
                    }
                    .padding(.bottom, 40)*/
                    
                    // Settings Text
                    Text("Settings")
                        .font(.custom("AbhayaLibre-ExtraBold", size: 55))
                        .foregroundColor(.text)
                        .padding(.top, 125)
                    
                    Spacer()

                }
                
                VStack(spacing:20) {
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "person.circle")
                                .offset(x:-50)
                            Text("Account")}
                        .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                        .padding()
                        .padding(.horizontal, 64)
                        .foregroundColor(Color.text)
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color.text, lineWidth: 6.0)
                                .fill(Color.button)
                                .shadow(radius: 5))})
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "heart.fill")
                                .offset(x:-30)
                            Text("My Favorites")}
                        .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                        .padding()
                        .padding(.horizontal, 43)
                        .foregroundColor(Color.text)
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color.text, lineWidth: 6.0)
                                .fill(Color.button)
                                .shadow(radius: 5))})
                    Button(action: {}, label: {
                        HStack{
                            NavigationLink(destination: HelpSupport()) {
                                Image(systemName: "questionmark.circle")
                                    .offset(x:-30)
                                Text("Help Support")}}
                        .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                        .padding()
                        .padding(.horizontal, 43)
                        .foregroundColor(Color.text)
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color.text, lineWidth: 6.0)
                                .fill(Color.button)
                                .shadow(radius: 5))})
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "info.circle")
                                .offset(x:-60)
                            Text("About")}
                        .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                        .padding()
                        .padding(.horizontal, 74)
                        .foregroundColor(Color.text)
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color.text, lineWidth: 6.0)
                                .fill(Color.button)
                                .shadow(radius: 5))})
                }
                
            }
            
            
        }
    }
    

    

#Preview {
    Settings()
}
