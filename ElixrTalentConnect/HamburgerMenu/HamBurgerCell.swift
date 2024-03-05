//
//  DashBoardCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 26/01/24.
//

import UIKit

/// Represents tjhe cell in the tableview.
class HamBurgerCell: UITableViewCell {
    
    /// Referencing Outlets.
    @IBOutlet weak var dashMenuTitles: UILabel!
    @IBOutlet weak var titleView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
