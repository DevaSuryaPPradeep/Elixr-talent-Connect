//
//  SignupViewcontroller+Extn.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 15/01/24.
//

import Foundation
import UIKit
//MARK: - Tableview  Methods.
extension SignUpViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    /// cellForRowAt function
    /// - Parameters:
    ///   - tableView: UItableview
    ///   - indexPath: indexPath
    /// - Returns: UITableViewCell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileDisplay") as? ProfileDisplayCell else{
            return UITableViewCell()
        }
        let dataCell = viewModalInstance.cellTypes[indexPath.row]
        profileCell.userText.text = dataCell.title
        profileCell.userInput.placeholder = dataCell.placeHolder
        profileCell.profileImage.image = dataCell.icon
        if dataCell == .password || dataCell == .confirmPassword {
            profileCell.privacyButton.setImage(UIImage(systemName: "eye"), for: .normal)
            profileCell.privacyButton.tintColor = UIColor.gray
            //  Set the initial image and tint color for the eye button
            // Set up the closure to toggle the secure text entry of the password field
            profileCell.eyeButtonClosure = {
                profileCell.userInput.isSecureTextEntry.toggle()
                    // Update the eye button image based on the secure text entry state
                let imageName = profileCell.userInput.isSecureTextEntry ? "eye.slash" : "eye"
                profileCell.privacyButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
        } else {
            // Hide the button for non-password fields
            profileCell.privacyButton.isHidden = true
        }
        profileCell.userInput.delegate = self
        //        // Return the configured cell
        return profileCell
    }
    
    /// HeightForRowAt
    /// - Parameters:
    ///   - tableView: UItableview
    ///   - indexPath: indexPath
    /// - Returns: Float type  value describes about the cell height.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

