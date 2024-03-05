//
//  CredentialDisplayTable.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 15/01/24.
//

import UIKit

class CredentialDisplayTable: UITableViewCell {
    
    /// Referencing Outlets.
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet weak var passwordFiels: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
      
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
