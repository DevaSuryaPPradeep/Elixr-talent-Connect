//
//  MyJobDisplayViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 02/02/24.
//

import UIKit

class MyJobDisplayViewController: UIViewController {
    
    // MARK: -  Variable Declarations.
    var appliedjobsArray :[Jobs] = []
    
    // MARK: - View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TableView Methods.
extension MyJobDisplayViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let jobCell = tableView.dequeueReusableCell(withIdentifier: "AppliedJobTableViewCell")as? AppliedJobTableViewCell
        else{
            return UITableViewCell()
        }
        return jobCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
