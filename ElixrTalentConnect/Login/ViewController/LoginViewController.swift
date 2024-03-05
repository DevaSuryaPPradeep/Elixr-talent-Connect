//
// LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 10/01/24.
//

import UIKit
import LocalAuthentication
/// LoginViewcontroller contains  user authentication,sign-in ,sign-up.
/// View in MVVM.
class LoginViewController: UIViewController {
    //MARK: - Variables & constants  declaration
    /// Variables and constants  declaration
    private var viewModel : LoginViewModel!
    
    //MARK: - Referencing Outlets.
    /// Referencing  Outlets.
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInPromptLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    //MARK: - View Life cycle.
    /// View Life cycle.- Contain method calls to setup basic UI.
    /// Setupcode to perform same action as that of IQkeyboard manager.
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        viewModel = LoginViewModel()
        self.navigationItem.setHidesBackButton(true, animated: true)
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    /// Function to get the basic UI layout.
    func UISetup() {
        backGroundImage.layer.cornerRadius = 20
        backGroundImage.clipsToBounds = true
    }
    
    /// Function to  perform navigaion to HomeviewController.
    func navigateToHome() {
        guard   let HomeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController else {
            return
        }
        self.navigationController?.pushViewController(HomeView, animated: true)
    }
    //MARK: - @IBAction for sign-in button.
    /// SignIntapped is the IBaction of the button "signInButton", which trigers alert actions,validation
    /// - Parameter sender: UIbutton named "signInButton".
    @IBAction func signInTapped(_ sender: UIButton){
        toAuthenticate()
    }
    
    //Authentication  for signin
    func toAuthenticate() {
        let loginModel = UserModel(userName: emailField.text ?? "" , passwordValue:passwordField.text ?? "")
        let validationResult = viewModel.validateCredentials(model: loginModel)
        if validationResult.isValid {
            viewModel.authenticateWithBiometrics { [weak self] (success, error) in
                guard let self = self else {
                    return
                }
                if success {
                    self.navigateToHome()
                } else {
                    if let error = error {
                        self.showErrorAlert(message: "Biometric authentication failed: \(error.localizedDescription)")
                    }
                }
            }
        } else {
            self.showErrorAlert(message: validationResult.message ?? "Invalid credentials.")
        }
    }
    
    //MARK: - alert
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: -  Keyboard configurations while displaying.
    /// This function is called when the keyboard is about to be displayed.
    ///It checks the size of the keyboard using information from the notification.
    /// - Parameter notification: notification on clicking the textfields.
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    /// This implementation is commonly used to handle the keyboard covering the text input fields in a view, ensuring a smooth user experience.
    /// - Parameter notification: notification on clicking the textfields.
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
   /// The deinit method removes the view controller from observing keyboard notifications to prevent memory leaks.
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}
    //MARK: -UITextFieldDelegate method to set up keyborad response.
    extension LoginViewController: UITextFieldDelegate{
        
        /// UItextfield  delegate method .
        /// - Parameter textField:UITextField
        /// - Returns: Bool
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }

