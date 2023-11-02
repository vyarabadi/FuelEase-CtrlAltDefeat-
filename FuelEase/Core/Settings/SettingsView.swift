import SwiftUI

struct Settings: View {
    @State private var activeSection: ActiveSection = .home
    @State private var isNavigating: Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
 
    enum ActiveSection: String {
        case home, car, clipboard, map, bell
    }
    
    var body: some View {
        NavigationView{
            // Main content (Settings Page)
            ZStack {
                Color("BackgroundColor")
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
                        .foregroundColor(Color("TextColor"))
                        .padding(.top, 125)
                    
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
                                    Text("home")
                                        .foregroundColor(Color("TextColor"))
                                        .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                                    
                                })
                                
                            }
                        })
                }
                
                VStack(spacing:20) {
                    Button(action: {}, label: {
                        HStack{
                            NavigationLink(destination: AccountView()){
                                Image(systemName: "person.circle")
                                    .offset(x:-50)
                                Text("Account")}}
                        .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                        .padding()
                        .padding(.horizontal, 64)
                        .foregroundColor(Color("TextColor"))
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color("TextColor"), lineWidth: 6.0)
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
                        .foregroundColor(Color("TextColor"))
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color("TextColor"), lineWidth: 6.0)
                                .fill(Color.button)
                                .shadow(radius: 5))})
                    Button(action: {}, label: {
                        HStack{
                            NavigationLink(destination: HelpSupport()){
                                Image(systemName: "questionmark.circle")
                                    .offset(x:-30)
                                Text("Help Support")}}
                        .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                        .padding()
                        .padding(.horizontal, 43)
                        .foregroundColor(Color("TextColor"))
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color("TextColor"), lineWidth: 6.0)
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
                        .foregroundColor(Color("TextColor"))
                        .shadow(radius: 5)
                        .background(
                            Capsule()
                                .stroke(Color("TextColor"), lineWidth: 6.0)
                                .fill(Color.button)
                                .shadow(radius: 5))})
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
#Preview {
    Settings()
}
