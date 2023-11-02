import Foundation
import FirebaseAuth

class LoginManager {
    static let shared = LoginManager()
    
    private init() { }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authDataResult = authDataResult {
                // Create a User instance with the authenticated user's information
                let user = User(
                    userId: authDataResult.user.uid,
                    firstName: "",
                    lastName: "",
                    phoneNumber: "",
                    primaryLocation: "",
                    email: authDataResult.user.email ?? "",
                    password: ""
                )
                completion(.success(user))
            } else {
                completion(.failure(NSError(domain: "YourDomain", code: 0, userInfo: nil)))
            }
        }
    }
}
