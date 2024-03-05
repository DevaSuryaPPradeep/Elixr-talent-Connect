//
//  SignUpViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 12/01/24.
//

import UIKit

/// SignUpViewController - is the view through which user can add their user Credentials.
class SignUpViewController: UIViewController {
    //MARK: - Referencing Outlets
    /// Referencing Outlets.
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signUpButton: UIButtonSetup!
    @IBOutlet weak var SignUpTableview: UITableView!
    @IBOutlet weak var promptSignup: UILabel!
    
    //MARK: - Variable  & Constants Declaration.
    /// Variable Declaration.
    let cellTypes: [SignupDataModel] = [.fullName, .emailAddress, .password, .confirmPassword]
    let viewModalInstance = SignUpViewModel()
    
    //MARK: - View life Cycle.
    /// View life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .highlighted)
        backButton.tintColor = UIColor.gray
        self.view.endEditing(true)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: -  Sign-in button setup.
    func UISetup (){
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
    }
        
    //MARK: - @IBAction for return back to the LoginScreen .
    ///@IBAction to set up return button to the rootview controller.
    /// - Parameter sender: UIButton
    @IBAction func returnAction(_ sender: UIButton) {
        popAction()
    }
    
    //MARK: - @IBAction for return back to the LoginScreen .
    /// Function SignIn- to perform sign in functionality.
    /// - Parameter sender: UIButton.
    @IBAction func signInTapped(_ sender: UIButton) {
        popAction()    }
    
    /// Function on poping back to the login screen.
    func popAction () {
        navigationController?.popViewController(animated: true)
    }

    //MARK: - Authentication on signUp.
    /// Function to navigate on validating some crirteria on the text fields.
    func authenticationOnSignup(){
        let fullNameCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .fullName) ?? 0, section: 0)) as? ProfileDisplayCell
        let emailCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .emailAddress) ?? 0, section: 0)) as? ProfileDisplayCell
        let passwordCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .password) ?? 0, section: 0)) as? ProfileDisplayCell
        let confirmPasswordCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of:.confirmPassword) ?? 0, section: 0)) as? ProfileDisplayCell
        let fullName = fullNameCell?.userInput.text
        let email = emailCell?.userInput.text
        let password = passwordCell!.userInput.text
        let confirmPassword = confirmPasswordCell?.userInput.text
        if let errorMessage = viewModalInstance.validateCredentials(fullName: fullName, emailAddress: email, password: password, confirmPassword: confirmPassword) {
            showAlert(message: errorMessage)
        }
    }
    //MARK: - @IBAction for Signup .
    /// SignIn action
    /// - Parameter sender: UIButton
    @IBAction func SignUpTapped(_ sender: UIButton) {
        authenticationOnSignup()
    }
    //MARK: - ALert on Authentications
    /// showAlert
    /// - Parameter message: This is the fuction responsible to the alert on validating the criterias.
    func showAlert(message:String){
        let ok = UIAlertAction(title: "OK", style: .default)
        let alertOnValidation = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertOnValidation.addAction(ok)
        present(alertOnValidation, animated: true)
    }
}

//MARK: - UITextfieldDelegate method to respond user interaction while 
extension SignUpViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

