//
//  PreviewData.swift
//  FuelEase
//
//  Created by Kelvin on 11/15/23.
//

import Foundation
import MapKit
import Contacts

struct PreviewData {
    
    static var apple: MKMapItem {
        
        let coordinate = CLLocationCoordinate2D(latitude: 35.3071, longitude: -80.7352)
        
        let addressDictionary: [String: Any] = [
            CNPostalAddressStreetKey: "1 Infinite Loop",
            CNPostalAddressCityKey: "Cupertino",
            CNPostalAddressStateKey: "CA",
            CNPostalAddressPostalCodeKey: "95014",
            CNPostalAddressCountryKey: "United States"
        ]
        
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Apple Inc."
        return mapItem
    }
}
