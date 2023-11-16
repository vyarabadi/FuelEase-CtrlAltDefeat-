//
//  FavoritesView.swift
//  FuelEase
//
//  Created by Daria Rizvanova on 11/4/23.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack{
                Text("My Favorites")
                    .font(.custom("AbhayaLibre-ExtraBold", size: 55))
                    .foregroundColor(Color("TextColor"))
                    .padding(.top, 130)
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
                    .frame(width:380, height:500)
                    .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("TextColor"), lineWidth:3))
                    .padding(.bottom,50)
                    
            }
            
            Text("Placeholder for favorite gas stations")
                .foregroundColor(Color("TextColor"))
                .font(.custom("AbhayaLibre-SemiBold", size: 22))
        }
    }
}

#Preview {
    FavoritesView()
}
