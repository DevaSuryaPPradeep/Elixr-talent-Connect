//
//  ShowJobDetailsViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 31/01/24.
//

import UIKit

class ShowJobDetailsViewController: UIViewController {
 
    @IBOutlet weak var jobTitle: UILabel!
    var jobInfoDescription :Jobs?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDisplay()
    }
    func configureDisplay (){
        guard let jobInfoDescription = jobInfoDescription else{
            return
        }
        jobTitle.text = jobInfoDescription.title
    }

   
}
