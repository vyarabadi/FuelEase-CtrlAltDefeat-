//
//  userViewModel.swift
//  FuelEase
//
//  Created by temp on 11/16/23.
//

import Foundation
import FirebaseFirestore
 
class userViewModel: ObservableObject {
     
    @Published var item = [Item]()
     
    private var db = Firestore.firestore()
     
    func fetchData() {
        db.collection("reports").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
             
            self.item = documents.map { (queryDocumentSnapshot) -> Item in
                let data = queryDocumentSnapshot.data()
                let ID = data["id"] as? String ?? ""
                let Gas_Type = data["gasType"] as? String ?? ""
                let Gas_Price = data["gasPrice"] as? Double ?? 0
                let Location = data["location"] as? String ?? ""
                let Store_Name = data["storeName"] as? String ?? ""
                let Time_Stamp = data["timeStamp"] as? Date ?? Date()
                return Item(gasPrice: Gas_Price , gasType: Gas_Type, location: Location, storeName: Store_Name, timeStamp: Time_Stamp)
            }
        }
    }
}
