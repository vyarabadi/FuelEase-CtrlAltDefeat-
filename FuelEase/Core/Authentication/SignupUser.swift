import Foundation
import FirebaseAuth
import FirebaseFirestore

// Define a User struct to store user information
struct User {
    var userId: String
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var primaryLocation: String
    var email: String
    var password: String
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private let db = Firestore.firestore()
    
    private init() { }

    func createUser(user: User, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authDataResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authDataResult = authDataResult {
                // Create a User instance with all the user information
                var newUser = User(
                    userId: authDataResult.user.uid,
                    firstName: user.firstName,
                    lastName: user.lastName,
                    phoneNumber: user.phoneNumber,
                    primaryLocation: user.primaryLocation,
                    email: authDataResult.user.email ?? "",
                    password: user.password
                )
                completion(.success(newUser))
                
                // Store additional user details in Firestore
                                self.db.collection("users").document(newUser.userId).setData([
                                    "firstName": newUser.firstName,
                                    "lastName": newUser.lastName,
                                    "phoneNumber": newUser.phoneNumber,
                                    "primaryLocation": newUser.primaryLocation,
                                    "email": newUser.email
                                ])
            } else {
                completion(.failure(NSError(domain: "YourDomain", code: 0, userInfo: nil)))
            }
        }
    }
    
    
}
