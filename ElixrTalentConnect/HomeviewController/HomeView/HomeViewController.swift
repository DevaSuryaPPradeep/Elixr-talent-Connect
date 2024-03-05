//
//  HomeViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 14/01/24.
//

import UIKit

/// HomeviewController is the view controller where the users is able to see the job oppprtunities in uikit
class HomeViewController: UIViewController {
    
    //MARK: -  Varaible declarations
    /// Variable and constant Declarations.
    var viewModal = JobViewModel()
    var isFavourite:Bool = false
    
    //MARK: -  Referencing outlets.
    /// Referencing Outlets.
    @IBOutlet weak var hamBurgerButton: UIButton!
    @IBOutlet weak var customSearchbar: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var jobDisplayTableView: UITableView!
    
    //MARK: - View life Cycle
    /// View llife cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customSearchbar.delegate = self
        getJobs()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.view.bringSubviewToFront(hamBurgerButton)
    }
    
    // Inside the viewWillAppear() the table view is reloaded . This reflects changes in the home screen when any of the change is made in other screens.
    override func viewWillAppear(_ animated: Bool) {
        jobDisplayTableView.reloadData()
    }
    
    //MARK: - @IBAction function of the textfield to  perform the search functionalnity
    /// searchFunctionality- this is to asign search functionality to the textfield called  custom textfield and it communicates with the viewModal functions where the main logic  is written
    /// - Parameter sender: UITextField
    @IBAction func searchFunctionality(_ sender: UITextField) {
        if let searchText = sender.text{
            viewModal.filteredData(with: searchText)
            jobDisplayTableView.reloadData()
        }
    }
    
    //MARK: - The API is initialized in the viewController.
    /// get Jobs- This is to make  make View Controller connect with view Model and also responsible for updating the UI of the screen.
    func getJobs() {
        activityIndicator.startAnimating()
        viewModal.getJobsList { [self] status in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidesWhenStopped = true
            }
            if status {
                DispatchQueue.main.async {
                    self.jobDisplayTableView.reloadData()
                }
            } else {
                showAlert()
            }
        }
    }
    
    //MARK: -  Alert .
    /// ShowAlert - Display the alert on failure while calling API.
    func showAlert(){
        let OkButton = UIAlertAction(title: "OK", style: .default)
        let alertDisplay = UIAlertController(title: "Alert", message: "Failure while calling API", preferredStyle: .alert)
        alertDisplay.addAction(OkButton)
        present(alertDisplay, animated: true)
    }
}

//MARK: - UITextFieldDelegate Methods to set the  the keyboard Functionalities.
// Extension on HomeViewController delgate methods.
extension HomeViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Hide the keyboard
        return true
    }
}
