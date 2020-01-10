//
//  ViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/10/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import Firebase
import FBSDKLoginKit
/**
 
 */

class LogInViewController: UIViewController , UITextFieldDelegate{
    deinit {
        print("Release login from memory")
    }
    let fireBase: FirebaseModel = {
       let fireBase = FirebaseModel()
        return fireBase
    }()
    let facebookMethods: FacebookModel = {
        let facebook = FacebookModel()
        return facebook
    }()
    
    let stackController: UIViewController = {
       var viewController = StackViewController()
        return viewController
    }()
    
    let rightMatchLogo: UIImageView = {
        var logo = UIImageView()
        logo.image = UIImage(named: "rightMatchLogo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    let segmentedControl: UISegmentedControl = {
        var segControl = UISegmentedControl(items: ["Login","Register"])
        segControl.selectedSegmentIndex = 0
        segControl.tintColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        segControl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        segControl.addTarget(self, action: #selector(loginOrRegister), for: .valueChanged)
        segControl.translatesAutoresizingMaskIntoConstraints = false
        return segControl
    }()
    
    let textFieldsContainer: UIView = {
        let textFields = UIView()
        textFields.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textFields.layer.borderWidth = 1.0
        textFields.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textFields.translatesAutoresizingMaskIntoConstraints = false
        textFields.layer.cornerRadius = 5
        return textFields
    }()
    
    var textFieldfContainerHeightAnchor: NSLayoutConstraint?
    
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // Email text field height constraint
    var emailTextFieldHeightConstraint: NSLayoutConstraint?
    
    let passwordTextField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    var passwordTextFieldHeightConstraint: NSLayoutConstraint?
    
    let reTypedPasswordTextField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Retype Password"
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    var reTypedPasswordTextFieldHeightConstraint: NSLayoutConstraint?
    
    
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Facebook Login Button
    let customFacebookButton: CustomFacebook = {
        let button = CustomFacebook()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var fbLoginButtonHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // Add the textFieldContainer to the main view
        view.addSubview(textFieldsContainer)
        // Add the segmented control to the main view
        view.addSubview(segmentedControl)
        // Texfield subviews
        textFieldsContainer.addSubview(emailTextField)
        textFieldsContainer.addSubview(passwordTextField)
        // Add login/register button to main View
        view.addSubview(loginRegisterButton)
        // Adding Facebook login Button
        
        
        // Setup textFieldContainer constraints
        setUpTextFieldContainer()
        // Setup email textFields
        setTextFields(textField: emailTextField, textFieldTopAnchor: textFieldsContainer.topAnchor, lineTopAnchor: emailTextField.bottomAnchor)
        // Password texField Contraints
        setTextFields(textField: passwordTextField, textFieldTopAnchor: emailTextField.bottomAnchor, lineTopAnchor: passwordTextField.bottomAnchor)
        // Setup Login/Register Button
        setUpLoginRegisterButton()
        // Setting up Facebook Login Button
        
        // <---------We must do the same thing with the ----------->
        //fbLoginButton.delegate = self
        
        
        loginRegisterButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        setUpSegmentedControl()
        view.addSubview(rightMatchLogo)
        setUpImageLogo()
        // Is user signed in???
        performLater()
        
        view.addSubview(customFacebookButton)
        setUpCustomFacebookButton()
        
        
    }
    /**
     
    */
    private func setUpImageLogo(){
        rightMatchLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rightMatchLogo.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -25).isActive = true
        rightMatchLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5, constant: 10).isActive = true
        rightMatchLogo.widthAnchor.constraint(equalTo: rightMatchLogo.heightAnchor, constant: 10).isActive = true
    }
    /**
     
    */
    private func setUpSegmentedControl(){
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.bottomAnchor.constraint(equalTo: textFieldsContainer.topAnchor, constant: -20).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 20)
        
    }
    /**
     Segemented Control buttons
    */
    @objc private func loginOrRegister(){
        if(segmentedControl.selectedSegmentIndex == 1){
            textFieldsContainer.addSubview(reTypedPasswordTextField)
            textFieldfContainerHeightAnchor?.constant = 120
            setTextFields(textField: reTypedPasswordTextField, textFieldTopAnchor: passwordTextField.bottomAnchor, lineTopAnchor: reTypedPasswordTextField.bottomAnchor)
            // Now to set the email and password height constaints
            emailTextFieldHeightConstraint?.isActive = false
            emailTextFieldHeightConstraint = emailTextField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 1/3)
            emailTextFieldHeightConstraint?.isActive = true
            
            // We must set the height constraints back to false to be able to reset the multiplier
            passwordTextFieldHeightConstraint?.isActive = false
            passwordTextFieldHeightConstraint = passwordTextField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 1/3)
            passwordTextFieldHeightConstraint?.isActive = true
            // Button
            loginRegisterButton.setTitle("Register", for: .normal)
        }else if segmentedControl.selectedSegmentIndex == 0 {
            textFieldfContainerHeightAnchor?.constant = 100
            // Re typed password
            reTypedPasswordTextField.removeFromSuperview()
//            reTypedPasswordTextFieldHeightConstraint = reTypedPasswordTextField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 0)
//            reTypedPasswordTextFieldHeightConstraint?.isActive = true
            // Email
            emailTextFieldHeightConstraint?.isActive = false
            emailTextFieldHeightConstraint = emailTextField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 1/2)
            emailTextFieldHeightConstraint?.isActive = true
            // Password
            passwordTextFieldHeightConstraint?.isActive = false
            passwordTextFieldHeightConstraint = passwordTextField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 1/2)
            passwordTextFieldHeightConstraint?.isActive = true
            // Button
            loginRegisterButton.setTitle("Log In", for: .normal)
        }
    }
    /**
     Sets up the UIView textFieldContainer with the specified constraints.
     
     The UIViews constraints are:
     1) x: Equal to that of the main parents UIViews center x anchor
     2) y: Equal to that of the main parents UIViews center y anchor
     3) width: Set equal to the width of the parents UIViews width, but subtrated by a constant of -24
     4) height: A constant of 100
    */
    private func setUpTextFieldContainer(){
        textFieldsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldsContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textFieldsContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        textFieldfContainerHeightAnchor = textFieldsContainer.heightAnchor.constraint(equalToConstant: 100)
        textFieldfContainerHeightAnchor?.isActive = true
        
    }
    
    /**
     Sets up the specified UITextField constraints based on the parameters. The left, width, and height anchor are the same for all textFields.
     The only constraint that changes is the topAnchor.
     
     - parameters:
        - textField: The UITextField that will be constrained within the textFieldContainer (UIView).
        - textFieldTopAnchor: The NSLayoutAnchor that the topAnchor of the textField will be constrained to.
        - lineTopAnchor: The NSLayout that the topAnchor of the lineSeperator (UIView) will be constrained to.
     
    */
    private func setTextFields(textField: UITextField ,textFieldTopAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, lineTopAnchor:NSLayoutYAxisAnchor ){
        textField.leftAnchor.constraint(equalTo: textFieldsContainer.leftAnchor, constant: 15).isActive = true
        textField.topAnchor.constraint(equalTo: textFieldTopAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: textFieldsContainer.widthAnchor).isActive = true
        // if textField is equal to emailTextField or passwordTextField
        if(textField == emailTextField){
            emailTextFieldHeightConstraint = textField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 1/2)
            emailTextFieldHeightConstraint?.isActive = true
        }else if textField == passwordTextField {
            passwordTextFieldHeightConstraint = textField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 1/2)
            passwordTextFieldHeightConstraint?.isActive = true
        }else if textField == reTypedPasswordTextField {
            // constant will be 1/3 since it'll only be called when the register segmented control is pressed.
            reTypedPasswordTextFieldHeightConstraint = textField.heightAnchor.constraint(equalTo: textFieldsContainer.heightAnchor, multiplier: 1/3)
            reTypedPasswordTextFieldHeightConstraint?.isActive = true
        }

        // A UIVIew will act as the line serperator for the textfields
        let line = UIView()
        textFieldsContainer.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        line.leftAnchor.constraint(equalTo: textFieldsContainer.leftAnchor).isActive = true
        line.topAnchor.constraint(equalTo: lineTopAnchor).isActive = true
        line.widthAnchor.constraint(equalTo: textFieldsContainer.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    
    /**
     Sets up the LoginRegisterButton below the texftFieldContainer (UIView).
     */
    private func setUpLoginRegisterButton(){
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: textFieldsContainer.bottomAnchor, constant: 15).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginRegisterButton.layer.cornerRadius = 12
        
    }
    
    /**
     Setting up Facebook login Button
     */
    private func setUpCustomFacebookButton(){
        customFacebookButton.topAnchor.constraint(equalTo: loginRegisterButton.bottomAnchor, constant: 15).isActive = true
        customFacebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customFacebookButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        customFacebookButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        customFacebookButton.layer.cornerRadius = 12
        customFacebookButton.setCornerRadius(cornerRadius: 12)
        customFacebookButton.button.addTarget(self, action: #selector(customLogin), for: .touchUpInside)
    }
    
    
    
    /**
     A method exposed to objective-c that will either log in the user to their profile's StackViewController or fail to log in if user's information is
     incorrect.
    */
    @objc private func login(){
        let emailString = emailTextField.text
        let passwordString = passwordTextField.text
        if emailString?.isEmpty ?? true || passwordString?.isEmpty ?? true {
            print("Must fill in the required text fields")
        }else {
            fireBase.login(navigator: self.navigationController!, email: emailString!, password: passwordString!, stackController: StackViewController())
        }
        
    }
    
    
    
    /**
     A method exposed to objective-c that will check the user's signin status. If the user is signed in then the User's StackViewController will be
     presented.
    */
    @objc private func isUserSignedIn(){
        fireBase.userSignInStatus(navigator: self.navigationController!)
    }
    @objc private func fbUserSigninStatus(){
        facebookMethods.userSignInStatus(loginController: self.navigationController!)
    }
    /**
    This method presents the stackController at a delay of .01 seconds. This is meant to give time to the ViewController to be
     created and processed. (??? Still not sure why this is necessary, my assumption is that the presentation is asynchronys at runtime)
    */
    func performLater(){
        perform(#selector(isUserSignedIn), with: nil, afterDelay: 0.01)
        //perform(#selector(fbUserSigninStatus), with: nil, afterDelay: 0.01)
    }
    
    /**
     An overrided method that removes the systems keyboard when any non textfield is touched.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc func customLogin(){
        facebookMethods.logIn(loginController: self.navigationController!)
    }
    
    
    
    
    



}

