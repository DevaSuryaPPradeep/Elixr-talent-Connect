//
//  MainTabController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 23/01/24.
//

import UIKit

class MainTabController: UITabBarController {
    
    /// View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changeRadiusOfTabBar()
        changeUnSelectedColor()
        changeHeightOfTabbar()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    /// changeRadiusOfTabBar - this is the function inorder to specify the tabbar design .
    func changeRadiusOfTabBar(){
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    /// changeUnSelectedColor - To specify the  unselected item tint color .
    func changeUnSelectedColor(){
        self.tabBar.unselectedItemTintColor = UIColor.white
    }
    /// changeHeightOfTabbar - To specify the height of the tabbar .
    func changeHeightOfTabbar(){
        
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame            = tabBar.frame
            tabFrame.size.height    = 100
            tabFrame.origin.y       = view.frame.size.height - 100
            tabBar.frame            = tabFrame
        }
    }
}
