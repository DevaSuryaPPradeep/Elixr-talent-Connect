//
//  DescriptionTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 01/02/24.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    /// Referencing Outlets.
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
