//
//  SignupViewModel.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 19/01/24.
//


import Foundation
//ViewModal for Signup.
class SignUpViewModel {
    
    //MARK: - Variable Declarations.
    var cellTypes: [SignupDataModel] = [.fullName, .emailAddress, .password, .confirmPassword]
    
    //MARK: - validate Credentials
    /// validateCredentials
    /// - Parameters:
    ///   - fullName: String value corresponds to the value expected in the usernameTextfield.
    ///   - emailAddress: String value corresponds to the value expected in the emailTextfield.
    ///   - password: String value corresponds to the value expected in the passwordTextfield.
    ///   - confirmPassword: String value corresponds to the value expected in the confirmPasswordTextfield.
    /// - Returns: String value that is accepted by the alert messages.
    func validateCredentials(fullName: String?, emailAddress: String?, password: String?, confirmPassword: String?) -> String? {
        guard let fullName = fullName, !fullName.isEmpty else {
            return "Please enter your full name."
        }
        guard let email = emailAddress, !email.isEmpty, email.contains("@"), email.contains(".") else {
            return "Please enter a valid email address."
        }
        guard let password = password, !password.isEmpty, password.count >= 8, password.contains(where: { $0.isLetter }), password.contains(where: { $0.isNumber }) else {
            return "Password should be at least 8 characters long and contain both alphabetic and numeric characters."
        }
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty, confirmPassword == password else {
            return "Passwords do not match."
        }
        return nil
    }
}
