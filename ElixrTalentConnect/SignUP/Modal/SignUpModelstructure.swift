//
//  SignUpModelstructure.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 16/01/24.
//
import UIKit
import Foundation

/// Data model for Signup view controller.
enum SignupDataModel {
    case fullName
    case emailAddress
    case password
    case confirmPassword
}

//MARK: - Extension to the SignupDataModel
extension SignupDataModel {
    
    /// title is of type String and is the extended property of the enum SignupDataModel
    var title: String {
        switch self {
        case .fullName:
            return "FULL NAME"
        case .emailAddress:
            return "EMAIL ADDRESS"
        case .password:
            return "PASSWORD"
        case .confirmPassword:
            return "CONFIRM PASSWORD"
        }
    }
    
    /// placeHolder is of type String and is the extended property of the enum SignupDataModel
    var placeHolder : String{
        switch self {
        case .fullName:
            return "Enter your user name."
        case .emailAddress:
            return "Enter your Email ID."
        case .password:
            return "Enter your password."
        case .confirmPassword:
            return "Confirm Your password "
        }
    }
    
    /// Icon is of type UIimage and is the extended property of the enum SignupDataModel.
    var icon : UIImage? {
        switch self{
        case .fullName: return UIImage(systemName: "person")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .emailAddress: return UIImage(systemName: "envelope")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .password: return UIImage(systemName: "lock")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .confirmPassword: return UIImage(systemName: "lock")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        }
    }
}
