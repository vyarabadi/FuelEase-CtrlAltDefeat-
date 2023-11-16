
import SwiftUI

struct AccountView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack(spacing: 0) {
            Color(.background)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
            
            RoundedRectangle(cornerRadius: 63)
                .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
                .overlay(
                    VStack {
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
                                        Text("Back")
                                            .foregroundColor(Color("TextColor"))
                                            .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                                        
                                    })
                                    
                                }
                            })
                        
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.top, 40)
                        
                        Text("Niner Norm")
                            .font(.title2)
                            .padding(.top, 10)
                        
                        Text("Ninernorm@uncc.edu")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "pencil")
                                Text("Edit Profile")
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 40)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                            .padding(.top, 20)
                        }
                        .padding(.horizontal, 16)
                        
                        VStack(spacing: 45) {
                            RoundedRectangle(cornerRadius: 27)
                                .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
                                .overlay(
                                    VStack {
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .padding(.top, 40)
                                        
                                        Text("Niner Norm")
                                            .font(.custom("AbhayaLibre-SemiBold", size: 22))
                                            .padding(.top, 10)
                                        
                                        Text("Ninernorm@uncc.edu")
                                            .font(.custom("AbhayaLibre-SemiBold", size: 16 ))
                                            .foregroundColor(.black)
                                            .padding(.top, 5)
                                        
                                        //buttons and other views
                                        Button(action: {}) {
                                            HStack {
                                                Image(systemName: "pencil")
                                                Text("Edit Profile")
                                                    .font(.custom("AbhayaLibre-SemiBold", size: 20))
                                            }
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 40)
                                            .background(buttonColor)
                                            .foregroundColor(textColor)
                                            .cornerRadius(25)
                                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                                            .padding(.top, 70)
                                        }
                                        
                                        Button(action: {}) {
                                            HStack {
                                                Image(systemName: "tag")
                                                Text("View Deals")
                                                    .font(.custom("AbhayaLibre-SemiBold", size: 20)) // Use the custom font
                                            }
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 40)
                                            .background(buttonColor)
                                            .foregroundColor(textColor)
                                            .cornerRadius(25)
                                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                                            .padding(.top, 10)
                                        }
                                        Spacer()
                                        
                                        Button(action: {}) {
                                            Text("Log Out")
                                                .font(.custom("AbhayaLibre-SemiBold", size: 20))
                                                .padding(.vertical, 12)
                                                .padding(.horizontal, 40)
                                                .background(Color("TextColor"))
                                                .foregroundColor(Color("Color"))
                                                
                                        }
                                        .padding(.bottom, 40)
                                        
                                    }
                                )
                                .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("TextColor"), lineWidth: 3))
                                .frame(width: 362, height: 633)
                                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                                .padding(.top, 100) 
                                
                            
                            Spacer()
                        }
                    }
                )
                .overlay(RoundedRectangle(cornerRadius: 63)
                            .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 3))
                .frame(width: 380, height: 620)
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                .padding(.bottom,40)
            
            HStack(spacing: 20) {
                /*Image(systemName: "house")
                Image(systemName: "magnifyingglass")
                Image(systemName: "map")
                Image(systemName: "bell")*/
            }
            
            .navigationBarBackButtonHidden(true)
        }
    }

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
