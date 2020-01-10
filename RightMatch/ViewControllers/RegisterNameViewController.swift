//
//  RegisterNameViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/27/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class RegisterNameViewController: UIViewController, UITextFieldDelegate {
    deinit {
        print("Released Name from memory")
    }
    private let backButton: UIButton = {
        let back = UIButton(type: .system)
        back.translatesAutoresizingMaskIntoConstraints = false
        //back.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        back.setTitle("◀︎", for: .normal)
        back.setTitleColor(#colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1), for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        return back
    }()
    private let progressStatus: UIPageControl = {
        let page = UIPageControl(frame: .zero)
        page.translatesAutoresizingMaskIntoConstraints = false
        page.numberOfPages = 7
        page.currentPage = 0
        page.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        page.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        page.isEnabled = false
        return page
    }()
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "What's your name?"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        name.adjustsFontSizeToFitWidth = true
        name.textAlignment = .center
        return name
    }()
    private let nameTextField: UITextField = {
        let name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.placeholder = "Name?"
        name.adjustsFontSizeToFitWidth = true
        name.textAlignment = .center
        name.font = UIFont(name: "HelveticaNeue", size: 30.0)
        return name
    }()
    private let continueButton: UIButton = {
        let cont = UIButton(type: .system)
        cont.translatesAutoresizingMaskIntoConstraints = false
        cont.setTitle("➤", for: .normal)
        cont.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        cont.layer.cornerRadius = 29
        cont.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        cont.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        cont.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        
        cont.titleLabel?.adjustsFontSizeToFitWidth = true
        cont.titleLabel?.minimumScaleFactor = 0.5
        //cont.titleLabel?.adjustsFontForContentSizeCategory = true
        
        return cont
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(backButton)
        view.addSubview(progressStatus)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(continueButton)
        setUpBackButton()
        setUpProgressBar()
        setUpNameLabel()
        setUpNameTextField()
        setUpContinueButton()
        
        // Do any additional setup after loading the view.
    }
    private func setUpBackButton(){
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        backButton.heightAnchor.constraint(equalTo: progressStatus.heightAnchor).isActive = true
    }
    private func setUpProgressBar(){
        progressStatus.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        progressStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressStatus.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        progressStatus.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/25).isActive = true
    }
    private func setUpNameLabel(){
        nameLabel.topAnchor.constraint(equalTo: progressStatus.bottomAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.2).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10).isActive = true
    }
    private func setUpNameTextField(){
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: nameLabel.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor).isActive = true
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        view.addSubview(line)
        line.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        line.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor).isActive = true
        line.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalTo: nameTextField.heightAnchor, multiplier: 1/30).isActive = true
    }
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        continueButton.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
    }
    @objc private func toNextPage(){
        if self.nameTextField.hasText {
            //print(nameTextField.text!)
            let name = nameTextField.text!
            let basicInfoController = RegisterBasicInformationViewController()
            let user = RightMatchUser(_name: name, _year: "", _month: "", _day: "", _age: 0, _myGender: "", _theirGender: "", _school: "", _educationLevel: "", lat: 0.0, long: 0.0)
            basicInfoController.user = user
            // We are setting a new stack of view controllers to navigate the registration part of the app
            navigationController?.setViewControllers([self,basicInfoController], animated: true)
        }else{
            print("Please fill in the required text")
        }
        
    }
    override func viewDidLayoutSubviews() {
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
    }
    /**
     An overrided method that removes the systems keyboard when any non textfield is touched.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

}
