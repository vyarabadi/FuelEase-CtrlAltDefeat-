//
//  AboutView.swift
//  FuelEase
//
//  Created by Daria Rizvanova on 11/4/23.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack{
                Text("Fuel Ease")
                    .font(.custom("AbhayaLibre-ExtraBold", size: 55))
                    .foregroundColor(Color("TextColor"))
                    .padding(.top,125)
                Text("Founded 2023")
                    .font(.custom("AbhayaLibre-SemiBold", size: 20))
                    .foregroundColor(.black)
    
                
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
                                Text("Settings")
                                    .foregroundColor(Color("TextColor"))
                                    .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                                
                            })
                            
                        }
                    })
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.color)
                    .frame(width:380, height:450)
                    .overlay(
                        VStack {
                            Text("FuelEase was created by 6 UNCC students in 2023, driven to simplify the search for affordable gas. Our app's user-friendly interface is designed to help you effortlessly find the best fuel deals in real-time, exactly where you are. With community-driven updates, you'll benefit from the most accurate and current gas prices. Join the FuelEase community today and start saving with confidence and convenience.")
                                .foregroundColor(Color("TextColor"))
                                .multilineTextAlignment(.center)
                                .font(.custom("AbhayaLibre-SemiBold", size: 20))
                                .padding()
                               })
                    .overlay(
                         RoundedRectangle(cornerRadius: 40)
                             .stroke(Color("TextColor"), lineWidth: 3))
                    .padding(.bottom,50)
                
            }
            
            
        }
    }
}

#Preview {
    AboutView()
}
