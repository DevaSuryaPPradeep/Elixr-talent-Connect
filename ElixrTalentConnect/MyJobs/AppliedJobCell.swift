//
//  AppliedJobCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 04/02/24.
//

import UIKit

class AppliedJobCell: UITableViewCell {
    
    // MARK: - Varaible Declarations.
    var  viewInstance = MyjobsViewController()
    
    // MARK: - IBOutlets.
    @IBOutlet weak var jobDescription: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function to configure Data.
    /// configureData - this  Function is called in the cell for rowat function to render data  from data soucrce.
    /// - Parameter dataitem: type: jobs.
    func configureData(dataitem : Jobs){
        jobTitle.text = dataitem.title
        jobDescription.text = dataitem.description
        jobLocation.text = dataitem.location
        jobStatus.text  = dataitem.status
        jobStatus.layer.cornerRadius = 5
        jobStatus.clipsToBounds = true
        if jobStatus.text  == "Scheduled" {
            jobStatus.backgroundColor = UIColor.green
        }
        else if jobStatus.text == "Rejected" {
            jobStatus.backgroundColor = UIColor.red
        }
        else if  jobStatus.text == "In Progress" {
            jobStatus.backgroundColor = UIColor.blue
        }
    }
}
