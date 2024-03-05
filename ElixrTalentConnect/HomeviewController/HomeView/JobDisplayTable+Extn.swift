//
//  JobDisplayTable+Extn.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation
import UIKit
//MARK: - Table view methods .
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModal.filteredJobs.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let jobItemCell = jobDisplayTableView.dequeueReusableCell(withIdentifier: "HomeInfoCell")as? HomeInfoCell else{
            return UITableViewCell()
        }
        let cellData  =  viewModal.filteredJobs[indexPath.row]
        jobItemCell.cellData(with: cellData)
        return jobItemCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModal.getInfoCell(at: indexPath.row)
        detailsViewNavigation(for: selectedCell)
    }
    
    /// Function to anvigate on clicking the cell.
    /// - Parameter jobDescription: is of type jobs
    func detailsViewNavigation (for jobDescription :Jobs){
        guard let detailsView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JobDetailsview")as?JobDetailsview else {
            return
        }
        // let viewModel = JobDetailsViewModel(with job: jobDescription)
        // detailsView.viewModel = viewModel
        detailsView.jobInfoDescription =  jobDescription
        navigationController?.pushViewController(detailsView, animated: true)
    }
}



