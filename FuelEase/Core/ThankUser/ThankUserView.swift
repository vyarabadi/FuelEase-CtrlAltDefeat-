import SwiftUI

struct ThankUserView: View {
    @State private var storeName: String = ""
    @State private var location: String = ""
    @State private var gasPrice: String = ""
    @Environment(\.presentationMode) var presentationMode
    
  
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
                
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(systemName: "arrow.backward")
                                Text("Back")
                            }
                            .foregroundColor(.blue)
                            .padding()
                            
                        }
                        Spacer()
                    }
                    .offset(x: 0, y: -350)
                

                Rectangle()
                    .frame(width: 400, height: 700)
                    .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
                    .cornerRadius(63)
                    .overlay(
                        RoundedRectangle(cornerRadius: 64)
                            .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 4)
                    )
                    .offset(x: 0, y: 80)

                
                        Text("Thank you! We are reviewing your gas price.")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                            .foregroundColor(Color.button)
                            .frame(width: 300, height: 200)
                            .background(
                                Capsule()
                                    .fill(Color.text)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.text, lineWidth: 4.0)
                                    )
                            )
                            .offset(x: 0, y: -0)
                    
                }
            }
                
        }
    


struct ThankUserView_Preview: PreviewProvider {
    static var previews: some View {
        ThankUserView()
    }
}
