//
//  GasView.swift
//  DevSwiftUI
//
//  Created by Kelvin
//
 
import SwiftUI
  
@propertyWrapper
struct GasView: View {
     
    @ObservedObject private var viewModel = userViewModel()
     
    var body: some View {
        NavigationView {
            
            List(viewModel.Item) { item in
                VStack(alignment: .leading) {
                    Text(item.gasType).font(.title)
                    Text(item.gasPrice).font(.subheadline)
                }
            }.navigationBarTitle("Items")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}
 
 
struct GasView_Previews: PreviewProvider {
    static var previews: some View {
        GasView()
    }
}
