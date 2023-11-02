import SwiftUI

struct HelpSupport: View {
    @State private var activeSection: ActiveSection = .HelpSupport
    @State private var ising: Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
 
    enum ActiveSection: String {
        case home, car, clipboard, map, bell, Report, HelpSupport
    }
    
    var body: some View {
        
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
                    Text("Help Support")
                        .font(.custom("AbhayaLibre-ExtraBold", size: 55))
                        .foregroundColor(.text)
                        .padding(.top, 125)
                    
                    Spacer()
                }
                
                VStack(spacing:20) {
                    Button(action: {}, label: {
                        HStack{
                            NavigationLink(destination: Report()){
                                Image(systemName: "phone.bubble.fill")
                                    .offset(x:-18)
                                Text("Contact Support")}}
                            .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                            .padding()
                            .padding(.horizontal, 35)
                            .foregroundColor(Color.text)
                            .shadow(radius: 5)
                            .background(
                                Capsule()
                                    .stroke(Color.text, lineWidth: 6.0)
                                    .fill(Color.button)
                                    .shadow(radius: 5))})
                    Button(action: {}, label: {
                        HStack{
                            NavigationLink(destination: Rating()){
                            Image(systemName: "star.fill")
                                .offset(x:-30)
                            Text("Rate our App!")}}
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
                }
                
            }
            
        }
    }

#Preview {
    HelpSupport()
}
