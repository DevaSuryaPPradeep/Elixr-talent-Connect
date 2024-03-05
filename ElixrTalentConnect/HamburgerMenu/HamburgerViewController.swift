//
//  dashBoardViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 26/01/24.
//

import UIKit
//MARK: -  Tableview methods.
/// dashBoardViewController - To present dashboard(Sidemenu)
class HamburgerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    /// Variable Declarations.
    var titleHeadings = ["About Us","Contact Us","Change Password","Privacy Policy","Terms & Conditions"]
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleHeadings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuItems = tableView.dequeueReusableCell(withIdentifier: "DashBoardCell")as? HamBurgerCell else {
            return UITableViewCell()
        }
        menuItems.dashMenuTitles.text = titleHeadings[indexPath.row]
        return menuItems
    }

    /// View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
