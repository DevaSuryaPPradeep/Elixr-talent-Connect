//
//  JobDetailsview.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 30/01/24.
//

import UIKit
// JobDetailsview will show the
class JobDetailsview: UIViewController {
    
    //MARK: - Variable & Constants decalarations.
    
    /// Variable decalarations.
    var  jobInfoDescription :Jobs?
    var wishListVariable :String?
    var appliedJobInstance = MyjobsViewController()
    let heartImage = UIImage(named: "heart")
    let heartFillImage = UIImage(named: "heart.fill")
    
    //MARK: - Referencing Outlets.
    /// Referencing Outlets.
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var typeOfJob: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var applyButton: UIScrollView!
    @IBOutlet weak var jobLevel: UILabel!
    @IBOutlet weak var jobDescription: UILabel!
    @IBOutlet weak var responsibilitiesDescription: UILabel!
    @IBOutlet weak var qualificationDescription: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    //MARK: -IBAction for ApplyForJob button.
    /// ApplyForJob - @IBAction for "apply for job" button  that appen job to the myjob view .
    /// - Parameter sender: UIbutton
    @IBAction func ApplyForJob(_ sender: UIButton) {
        applyJob()
    }
    
    //MARK: - @IBAction For Favourite button action.
    @IBAction func FavoriteButtonAction(_ sender: UIButton) {
        checkifValuePresent()
        actionOnCheck()
    }
    //MARK: - View Life Cycle.
    
    override func viewWillAppear(_ animated: Bool) {
        actionOnCheck()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataConfigure()
        UISetup()
    }
    
    /// UISetup - is the function to setup the UI.
    func UISetup(){
        userImage.layer.cornerRadius = userImage.frame.width / 2
        applyButton.layer.cornerRadius = 5
        applyButton.clipsToBounds = true
    }
    
    //MARK: - Data Configure.
    /// Function that renders data and presents data to the UI.
    func dataConfigure(){
        guard let jobInfoDescription = jobInfoDescription else {
            return
        }
        jobTitle.text = jobInfoDescription.title
        location.text = jobInfoDescription.location
        jobLevel.text = "Intermediate"
        jobDescription .text = jobInfoDescription.description
        responsibilitiesDescription.text = jobInfoDescription.responsibilities
        qualificationDescription.text =
        jobInfoDescription.requirements
        wishListVariable = jobInfoDescription.id
    }
    
    //MARK: - Function to perform applyForJOb.
    /// applyjob functionality firs
    func applyJob() {
        var savedJobs = getSavedJobs()
        guard let jobInfoDescription = jobInfoDescription, !isJobAlreadyApplied(savedJobs, job: jobInfoDescription) else {
            showAlert(message: "Job already applied")
            return
        }
        savedJobs.append(jobInfoDescription)
        do {
            let appliedJobsData = try JSONEncoder().encode(savedJobs)
            UserDefaults.standard.set(appliedJobsData, forKey: .userKey)
            showAlert(message: "Job application successful.")
            
        } catch {
            showAlert(message: "ERROR")
        }
    }
    
    /// getSavedJobs -This is function responsible of casting to the value of savedJobs
    /// - Returns: An array of type jobs.
    func getSavedJobs() -> [Jobs] {
        guard let savedJobData = UserDefaults.standard.data(forKey: .userKey),
              let savedJobs = try? JSONDecoder().decode([Jobs].self, from: savedJobData) else {
            return []
        }
        return savedJobs
    }
    
    /// isJobAlreadyApplied -This function is used to check whether the same job is saved again using job ID.
    /// - Parameters:
    ///   - savedJobs: Array of applied jobs.
    ///   - job: is of type of the data Model.
    /// - Returns: Returns  a boolean value  , based on this alert is message is altered.
    func isJobAlreadyApplied(_ savedJobs: [Jobs], job: Jobs) -> Bool {
        guard !savedJobs.isEmpty else {
            return false
        }
        let isApplied = savedJobs.contains(where: { $0.id == job.id })
        return isApplied
    }
    //MARK: - Alert on Job apply and Duplicate job request
    /// showAlert -  this function is called when job is applied for the first time and also preseted when the same job is applied twice.
    /// - Parameter message: is a string variable that changes its value based on the activation of  applyforJob() and applyforJob1().
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Functions to  perform Favourite Button action.
    func checkifValuePresent(){
        guard let uniqueJobId = wishListVariable else {
            return
        }
        let isWishList = UserDefaults.standard.bool(forKey: uniqueJobId)
        UserDefaults.standard.set(!isWishList, forKey: uniqueJobId)
    }
    
    /// actionOnCheck - Function to set the value in the isWishList variable. Based on  the value of this variable isFavourite button is functioning.
    func actionOnCheck (){
        guard let uniqueJobId =  wishListVariable else{
            return
        }
        let isWishList = UserDefaults.standard.bool(forKey: uniqueJobId)
        favouriteButton.setImage(isWishList ? heartFillImage : heartImage, for: .normal)
    }
}

