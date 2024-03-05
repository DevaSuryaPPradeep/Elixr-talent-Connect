//
//  MyjobsViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 04/02/24.
//

import UIKit
// MyjobsViewController - Displays all applied jobs  in a tableview.
class MyjobsViewController: UIViewController {
    
    //MARK: - IBOutlets.
    @IBOutlet weak var appliedJobCell: UITableView!
    @IBOutlet weak var CustomSearchBar: UITextField!
    
    //MARK: - Variable Declarations.
    var savedJobs: [Jobs] = []
    
    //MARK: - View life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        savedJobs = getSavedJobs()
        appliedJobCell.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        savedJobs = getSavedJobs()
        appliedJobCell.reloadData()
    }
    
    //MARK: - Applied jobs are acessed using userdefault method
    /// getSavedJobs - The data stored in userdefault is decoded and  assigned to a array of type Jobs.
    /// - Returns: An array of jobs.
    func getSavedJobs() -> [Jobs] {
        guard let savedJobData = UserDefaults.standard.data(forKey: .userKey),
              let savedJobs = try? JSONDecoder().decode([Jobs].self, from: savedJobData) else {
            return []
        }
        return savedJobs
    }
}

//MARK: - TableView  Methods.
extension MyjobsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard   let displayCell  = tableView.dequeueReusableCell(withIdentifier: "AppliedJobCell")as? AppliedJobCell else {
            return UITableViewCell()
        }
        let job = savedJobs[indexPath.row]
        displayCell.configureData(dataitem:job);
        return displayCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}
