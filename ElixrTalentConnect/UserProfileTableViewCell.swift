//
//  UserProfileTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 01/02/24.
//

import UIKit

class UserProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var LevelOfJob: UILabel!
    @IBOutlet weak var locationDetails: UILabel!
    @IBOutlet weak var jobType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
