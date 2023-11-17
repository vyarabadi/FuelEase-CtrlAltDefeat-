//
//  DevSwiftUIApp.swift
//  FuelEase
//
//  Created by temp on 11/16/23.
//


import SwiftUI
import Firebase

@main
struct DevSwiftUIApp: App {
    
   init() {
   FirebaseApp.configure()
   }
    
   var body: some Scene {
       WindowGroup {
           GasView()
       }
   }
}
