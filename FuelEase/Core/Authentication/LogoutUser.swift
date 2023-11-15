//
//  LogoutUser.swift
//  FuelEase
//
//  Created by Laya sagari Mangalagiri on 11/14/23.
//

import Foundation
import FirebaseAuth

class LogoutManager {
    static let shared = LogoutManager()
    
    private init() { }
    
    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
}
