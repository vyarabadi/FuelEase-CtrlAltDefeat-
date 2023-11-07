//  NavView.swift
//  FuelEase
//
//  Created by Daria Rizvanova on 11/5/23.
//
import SwiftUI

struct NavView: View {
    init() {
           let tabBarAppearance = UITabBarAppearance()
           tabBarAppearance.configureWithOpaqueBackground()

    
           tabBarAppearance.backgroundColor = UIColor(named: "ButtonColor")

        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(named:"TextColor")
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "TextColor")]

        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(named:"Color")
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named:"Color")]


           UITabBar.appearance().standardAppearance = tabBarAppearance
           if #available(iOS 15.0, *) {
               UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
           }
       }
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            PriceReportView()
                .tabItem {
                    Label("Find gas", systemImage: "car.fill")
                }
            PriceReportView()
                .tabItem {
                    Label("Price log", systemImage: "clipboard.fill")
                }
            PriceReportView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            PriceReportView()
                .tabItem {
                    Label("Notification", systemImage: "bell.fill")
                }
        }
        .accentColor(.black)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavView()
}

