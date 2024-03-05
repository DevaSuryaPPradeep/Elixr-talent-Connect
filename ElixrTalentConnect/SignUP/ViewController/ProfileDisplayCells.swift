//
//  ProfileDisplay.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 14/01/24.
//

import UIKit

/// Cell file created to contain all cell related data of the SignupTableview.
class ProfileDisplayCell: UITableViewCell {
    
    //MARK: -Referencing Outlets
    /// Referencing Outlets.
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var userText: UILabel!
    
    var eyeButtonClosure: (() -> Void)?
    
    //MARK: - View life cycle.
    /// View life cycle.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
     
    /// privacyButtonTapped -Fuction used to trigger the functionality of showing  and hiding the password.
    @objc func privacyButtonTapped () {
        userInput.isSecureTextEntry.toggle()
        if  let imageName = userInput.isSecureTextEntry ? "eye.slash" : "eye"{
            privacyButton.setImage(UIImage(systemName: imageName),for:.normal)
            privacyButton.tintColor = UIColor.gray
            privacyButton.isHidden = false
        }
    }
    @objc  func eyeButtonTapped(_sender : UIButton){
        eyeButtonClosure?()
    }
}

