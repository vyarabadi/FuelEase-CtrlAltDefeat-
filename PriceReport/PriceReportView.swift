//
//  PriceReportView.swift
//  FuelEase
//
//  Created by Hannah Roop on 10/26/23.
//

import SwiftUI
import FirebaseFirestore

struct PriceReportView: View {
    
    @State private var storeName: String = ""
    @State private var location: String = ""
    @State private var gasPrice: String = ""
    @State private var gastype: String = ""
    @State private var showThankUserView = false
    @State private var showErrorStoreName = false
    @State private var showErrorLocation = false
    @State private var showErrorGasPrice = false
    @State private var showErrorGasType = false
    
    
    private var isFormValid: Bool {
        (!storeName.isEmpty) && (!location.isEmpty) && (!gasPrice.isEmpty) && (!gastype.isEmpty)
        }
    
    private func submitReport() {
        guard let gasPriceDouble = Double(gasPrice) else {
            print("Gas price is not a valid number.")
            showErrorGasPrice = true
            return
        }
    
        let db = Firestore.firestore()
            db.collection("reports").addDocument(data: [
                "storeName": storeName,
                "location": location,
                "gasPrice": gasPriceDouble,
                "gasType": gastype,
                "timestamp": Timestamp(date: Date())
            ]) { error in
                if let error = error {
                    
                    print("Error adding document: \(error)")
                    
                } else {
                    
                    print("Document added successfully")
                    
                    storeName = ""
                    location = ""
                    gasPrice = ""
                    gastype = " "
                    showThankUserView = true
                }
            }
        }
    
    var body: some View {
        ZStack {
            
            

            
            Color("BackgroundColor")
            VStack {
                   
                    
                    Button(action: {
                        print("Account")
                    }) {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.text)
                    }
                    .offset(x: 160, y: 90)
                    
                    
                    
                    Rectangle()
                        .frame(width: 400, height: 700)
                        .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
                        .cornerRadius(63)
                        .overlay(
                            RoundedRectangle(cornerRadius: 64)
                                .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 4)
                        )
                        .offset(x: 0, y: 110)
                        .overlay(
                            Text("Report gas price ")
                                .font(.custom("AbhayaLibre-ExtraBold", size: 48))
                                .foregroundColor(Color("TextColor"))
                                .padding(.bottom, 20)
                                .offset(x: 0, y: -140)
                        )
                    
                TextField("Report Store Name", text: $storeName)
                    .autocapitalization(.words)
                    .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                    .padding()
                    .foregroundColor(Color("TextColor"))
                    .background(
                        Capsule()
                            .fill(Color.button)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(showErrorStoreName ? Color.red : Color("TextColor"), lineWidth: 4)
                                )
                            .onChange(of: storeName) { _ in
                                    showErrorStoreName = storeName.isEmpty
                                }
                    

                    )
                    .frame(width: 340, height: 50)
                    .offset(x: 0, y: -450)
                    .overlay(
                        Text(showErrorStoreName ? "Please fill out this field with the store name" : "")
                            .offset(x: 0, y: -400)
                            .foregroundColor(.red)
                    )

                
                    
                TextField("Enter Location", text: $location)
                    .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                    .padding()
                    .foregroundColor(Color("TextColor"))
                    .background(
                        Capsule()
                            .fill(Color.button)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(showErrorLocation ? Color.red : Color("TextColor"), lineWidth: 4)
                            )
                    )
                    .frame(width: 340, height: 50)
                    .offset(x: 0, y: -400)
                    .onChange(of: location) { _ in
                        showErrorLocation = location.isEmpty
                    }
                    .overlay(
                        Text(showErrorLocation ? "Please fill out this field with the location" : "")
                            .offset(x: 0, y: -350)
                            .foregroundColor(.red)
                    )

                TextField("Enter Gas Price", text: $gasPrice)
                    .keyboardType(.decimalPad) // Numeric keypad
                    .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                    .padding()
                    .foregroundColor(Color("TextColor"))
                    .background(
                        Capsule()
                            .fill(Color.button)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(showErrorGasPrice ? Color.red : Color("TextColor"), lineWidth: 4)
                            )
                    )
                    .frame(width: 340, height: 50)
                    .offset(x: 0, y: -350)
                    .onChange(of: gasPrice) { newValue in
                        // Filter out non-numeric characters
                        gasPrice = newValue.filter { "0123456789.".contains($0) }
                        showErrorGasPrice = gasPrice.isEmpty
                    }
                    .overlay(
                        Text(showErrorGasPrice ? "Please fill out this field with the gas price" : "")
                            .offset(x: 0, y: -300)
                            .foregroundColor(.red)
                    )

                
                TextField("Enter Gas Type", text: $gastype)
                    .keyboardType(.decimalPad) // Numeric keypad
                    .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                    .padding()
                    .foregroundColor(Color("TextColor"))
                    .background(
                        Capsule()
                            .fill(Color.button)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(showErrorGasPrice ? Color.red : Color("TextColor"), lineWidth: 4)
                            )
                    )
                    .frame(width: 340, height: 50)
                    .offset(x: 0, y: -300)
                    .onChange(of: gastype) { newValue in
                        // Filter out non-numeric characters
                        showErrorGasType = gastype.isEmpty
                    }
                    .overlay(
                        Text(showErrorGasType ? "Please fill out this field with the gas type" : "")
                            .offset(x: 0, y: -250)
                            .foregroundColor(.red)
                    )

                    
                    //REPORT BUTTON
                
                    
                    
                VStack {
                           
                            Button(action: {
                                    
                                    showErrorStoreName = storeName.isEmpty
                                    showErrorLocation = location.isEmpty
                                    showErrorGasPrice = gasPrice.isEmpty
                                if !showErrorStoreName && !showErrorLocation && !showErrorGasPrice {
                                        submitReport()
                                        self.showThankUserView = true
                                    }

                                self.showThankUserView = true // Set to true to show ThankUserView
                            }) {
                                Text("Report")
                                    .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                                    .foregroundColor(Color.button)
                                    .frame(width: 220, height: 50)
                                    .background(
                                        Capsule()
                                            .fill(Color.text)
                                    )
                            }
                            .disabled(!isFormValid)
                            .offset(x: 0, y: -250)
                        }
                        .fullScreenCover(isPresented: $showThankUserView) {
                           
                            ThankUserView()
                        }
                    }
                }

                

                

        .onAppear(perform: {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(named: "ButtonColor")
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        })
        .background(
            RoundedRectangle(cornerRadius: 50)
                .shadow(radius: 5)
        )
        .accentColor(Color("TextColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    PriceReportView()
}
