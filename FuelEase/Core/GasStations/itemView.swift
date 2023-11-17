//
//  itemView.swift
//  FuelEase
//
//  Created by temp on 11/16/23.
//

import Foundation
 
struct Item: Identifiable{
    var id: String = UUID().uuidString
    var gasPrice: Double
    var gasType: String
    var location: String
    var storeName: String
    var timeStamp: Date
}
