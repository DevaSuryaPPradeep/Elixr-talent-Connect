//  JobDisplayTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import UIKit

/// JobDisplayTableViewCell is the place where all datas related to tableview cell is shown, and referenced.
class JobDisplayTableViewCell: UITableViewCell {
    
    /// Referencing Outlets
    @IBOutlet weak var displayView: UIViewSetUp!
    @IBOutlet weak var jobdetails: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var jobHeading: UILabel!
    @IBOutlet weak var deadlineDate: UILabel!
    
    /// Variables  & constants declarattions.
    var viewModalData = JobViewModel()
    let darkBlue =  UIColor(red: 50/255, green: 36/255, blue: 79/255, alpha: 1.0)
    let lightTheme = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initiaUISetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func addToFavouriteAction(_ sender: UIButton) {
        viewModalData.favouriteButtonAction()
        UIUpdate()
    }
    
    /// cellData- To assign th tablevalues with data from data model.
    /// - Parameter dataItem: dataItem is of type Jobs.
    func cellData(with dataItem:Jobs){
        guard let formattedDate  = viewModalData.formattingFunction(_dateString: dataItem.deadlineDate) else {
            return
        }
        guard let formattedDate = viewModalData.formattingFunction(_dateString: dataItem.deadlineDate) else {
            return
            
        }
        deadlineDate.text  = formattedDate
        
        deadlineDate.text = formattedDate
        jobHeading.text = dataItem.title
        jobLocation.text = dataItem.location
        jobdetails.text = dataItem.description
        viewModalData.idInstance = dataItem.id
        UIUpdate()
    }
    
    func UIUpdate()
    {
        guard let uniqueJobId = viewModalData.idInstance else {
            return
        }
        let isFavourite = UserDefaults.standard.bool(forKey: uniqueJobId)
        if isFavourite{
            displayView.backgroundColor =  darkBlue
            jobdetails.textColor = lightTheme
            jobHeading.textColor = lightTheme
            jobLocation.textColor  = lightTheme
            favoriteButton.setImage(UIImage(named: "heart.fill"), for: .normal)
        } else {
            initiaUISetup()
        }
    }
    func initiaUISetup(){
        displayView.backgroundColor = UIColor.white
        jobdetails.textColor = darkBlue
        jobHeading.textColor = darkBlue
        jobLocation.textColor  = darkBlue
        favoriteButton.setImage(UIImage(named: "heart"), for: .normal)
    }
}
