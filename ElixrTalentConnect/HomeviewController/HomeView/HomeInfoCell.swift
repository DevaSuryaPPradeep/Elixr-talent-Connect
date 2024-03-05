//  JobDisplayTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import UIKit

/// JobDisplayTableViewCell is the place where all datas related to tableview cell is shown, and referenced.
class HomeInfoCell: UITableViewCell {
    
    //MARK: - Referencing Outlets
    /// Referencing Outlets
    @IBOutlet weak var displayView: UIViewSetUp!
    @IBOutlet weak var jobdetails: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var jobHeading: UILabel!
    @IBOutlet weak var deadlineDate: UILabel!
    
    //MARK: - Variables  & constants declarattions.
    /// Variables  & constants declarattions.
    var viewModalData = JobViewModel()
    let darkBlue =  UIColor(red: 50/255, green: 36/255, blue: 79/255, alpha: 1.0)
    let lightTheme = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
    let heart = UIImage(named: "heart")
    let heartFill = UIImage(named: "heart.fill")
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: -   @IBAction for favorite button.
    /// addToFavouriteAction- this is the function  to declare certain job lists is being selected by the user
    /// - Parameter sender: UIbutton
    @IBAction func addToFavouriteAction(_ sender: UIButton) {
        viewModalData.favouriteButtonAction()
        UIUpdate()
    }
    
    /// UIUpdate() - this is the function trigers UI change based on the acrion  of addToFavouriteAction IBaction.
    func UIUpdate(){
        guard let uniqueJobId = viewModalData.idInstance else {
            return
        }
        let isFavourite = UserDefaults.standard.bool(forKey: uniqueJobId)
        displayView.backgroundColor =  isFavourite ? darkBlue: lightTheme
        jobdetails.textColor =  isFavourite ? lightTheme : darkBlue
        jobHeading.textColor = isFavourite ? lightTheme : darkBlue
        jobLocation.textColor = isFavourite ? lightTheme : darkBlue
        favoriteButton.setImage(isFavourite ? heartFill : heart, for: .normal)
    }
    //MARK: -   Data rendering
    /// cellData- To assign th tablevalues with data from data model.
    /// - Parameter dataItem: dataItem is of type Jobs.
    func cellData(with dataItem:Jobs){
        guard let formattedDate  = viewModalData.formattingFunction(_dateString: dataItem.deadlineDate) else {
            return
        }
        deadlineDate.text  = formattedDate
        jobHeading.text = dataItem.title
        jobLocation.text = dataItem.location
        jobdetails.text = dataItem.description
        viewModalData.idInstance = dataItem.id
        UIUpdate()
    }
}

