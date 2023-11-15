//
//  UserManager.swift
//  FuelEase
//
//  Created by Diya Patel on 11/13/23.
//

import Foundation
import Combine

// made change

class UserManager: ObservableObject {
    static let shared = UserManager()

    @Published var currentUser: User?

    private init() {}
    func updateUser(_ updatedUser: User) {
            currentUser = updatedUser
        }
}
