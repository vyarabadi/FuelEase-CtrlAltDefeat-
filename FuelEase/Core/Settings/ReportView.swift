import SwiftUI

struct Report: View {
    @State private var submit = false
    @State var name: String = ""
    @State var email: String = ""
    @State var message: String = ""
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
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
                            Text("Help Support")
                                .foregroundColor(Color("TextColor"))
                                .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                            
                        })
                        
                    }
                })
            VStack {
                
                Text("Please Enter Inquiry:" )
                    .font(.custom("AbhayaLibre-ExtraBold", size: 40))
                    .padding()
                HStack {
                    
                    TextField("Enter Name", text:$name, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .font(.custom("AbhayaLibre-ExtraBold", size: 25))
                        .padding(.leading, 9)
                    
                    TextField("Enter Email", text:$email
                    )
                    .textFieldStyle(.roundedBorder)
                    .font(.custom("AbhayaLibre-ExtraBold", size: 25))
                    .padding(.trailing,9)
                }
                HStack {
                    TextField("Type Here", text:$message, axis: .vertical)
                        .padding(.vertical, 20)       .textFieldStyle(.roundedBorder)
                        .font(.custom("AbhayaLibre-ExtraBold", size: 25))
                        .padding(.horizontal, 9)
                }
                HStack {
                    Button("Submit") {
                        submit = true
                    }
                    .alert("Thank you for your inquiry. We will get back to you as soon as possible!", isPresented: $submit) {
                        Button("OK", role: .cancel) { }}
                    .font(.custom("AbhayaLibre-ExtraBold", size: 25))  
                    .foregroundColor(Color("TextColor"))
                    .padding()
                    .background(Color("Color"))
                    .cornerRadius(25)}
                
                .padding()
            }
        }
    }
}

#Preview {
    Report()
}
    
