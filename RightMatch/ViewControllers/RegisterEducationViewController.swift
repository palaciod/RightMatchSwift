//
//  RegisterEducationViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/23/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class RegisterEducationViewController: UIViewController, UITextFieldDelegate {
    deinit {
        print("Released Education from memory")
    }
    var user: RightMatchUser?
    private var educationLevel: String = ""
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
        page.currentPage = 2
        page.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        page.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        page.isEnabled = false
        return page
    }()
    private let schoolLabel: UILabel = {
        let school = UILabel()
        school.translatesAutoresizingMaskIntoConstraints = false
        school.text = "Where did you go for school?"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        school.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        school.adjustsFontSizeToFitWidth = true
        school.textAlignment = .center
        return school
    }()
    private let schoolTextField: UITextField = {
        let school = UITextField()
        school.translatesAutoresizingMaskIntoConstraints = false
        school.placeholder = "School?"
        school.adjustsFontSizeToFitWidth = true
        school.textAlignment = .center
        school.font = UIFont(name: "HelveticaNeue", size: 30.0)
        return school
    }()
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    private let highestEducationLabel: UIView = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What is your highest level of education?"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    private let highSchoolButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.setTitle("High School", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    private let undergradButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.setTitle("Undergrad", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    private let postGrad: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.setTitle("Postgrad", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    // The iphone SE small screen makes the arrow button look obscurly large... try to fix it
    private let continueButton: UIButton = {
        let cont = UIButton(type: .system)
        cont.translatesAutoresizingMaskIntoConstraints = false
        cont.setTitle("➤", for: .normal)
        cont.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        cont.layer.cornerRadius = 29
        cont.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        cont.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        cont.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        cont.titleLabel?.adjustsFontSizeToFitWidth = true
        cont.titleLabel?.adjustsFontForContentSizeCategory = true
        return cont
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(backButton)
        view.addSubview(progressStatus)
        view.addSubview(schoolLabel)
        view.addSubview(schoolTextField)
        view.addSubview(highestEducationLabel)
        view.addSubview(highSchoolButton)
        highSchoolButton.addTarget(self, action: #selector(highSchoolButtonSelected), for: .touchUpInside)
        view.addSubview(undergradButton)
        undergradButton.addTarget(self, action: #selector(underGradButtonSelected), for: .touchUpInside)
        view.addSubview(postGrad)
        postGrad.addTarget(self, action: #selector(postGradButtonSelected), for: .touchUpInside)
        view.addSubview(continueButton)
        setUpProgressBar()
        setUpSchoolLabel()
        setUpBackButton()
        setUpSchoolInput()
        setUpHighestEducation()
        setUpEducationButtons(button: highSchoolButton, yAnchor: highestEducationLabel.bottomAnchor, xAnchor: view.centerXAnchor)
        setUpEducationButtons(button: undergradButton, yAnchor: highSchoolButton.bottomAnchor, xAnchor: view.centerXAnchor)
        setUpEducationButtons(button: postGrad, yAnchor: undergradButton.bottomAnchor, xAnchor: view.centerXAnchor)
        setUpContinueButton()
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
    private func setUpSchoolLabel(){
        schoolLabel.topAnchor.constraint(equalTo: progressStatus.bottomAnchor, constant: 20).isActive = true
        schoolLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        schoolLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        schoolLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10).isActive = true
    }
    private func setUpSchoolInput(){
        schoolTextField.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor).isActive = true
        schoolTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        schoolTextField.widthAnchor.constraint(equalTo: schoolLabel.widthAnchor).isActive = true
        schoolTextField.heightAnchor.constraint(equalTo: schoolLabel.heightAnchor).isActive = true
        // We are setting up a line that looks like it carries the text
        view.addSubview(line)
        line.topAnchor.constraint(equalTo: schoolTextField.bottomAnchor).isActive = true
        line.centerXAnchor.constraint(equalTo: schoolTextField.centerXAnchor).isActive = true
        line.widthAnchor.constraint(equalTo: schoolTextField.widthAnchor, multiplier: 1, constant: 0).isActive = true
        line.heightAnchor.constraint(equalTo: schoolTextField.heightAnchor, multiplier: 1/25, constant: 0).isActive = true
    }
    private func setUpHighestEducation(){
        highestEducationLabel.topAnchor.constraint(equalTo: line.bottomAnchor).isActive = true
        highestEducationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        highestEducationLabel.widthAnchor.constraint(equalTo: schoolLabel.widthAnchor).isActive = true
        highestEducationLabel.heightAnchor.constraint(equalTo: schoolLabel.heightAnchor).isActive = true
    }
    private func setUpEducationButtons(button: UIButton, yAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, xAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>){
        button.topAnchor.constraint(equalTo: yAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalTo: xAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10).isActive = true
    }
    @objc private func highSchoolButtonSelected(){
        highSchoolButton.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        undergradButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        postGrad.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        educationLevel = "High School"
    }
    @objc private func underGradButtonSelected(){
        undergradButton.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        highSchoolButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        postGrad.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        educationLevel = "Undergraduate"
    }
    @objc private func postGradButtonSelected(){
        postGrad.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        highSchoolButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        undergradButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        educationLevel = "Postgraduate"
    }
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        continueButton.addTarget(self, action: #selector(storeEducationData), for: .touchUpInside)
    }

    @objc private func storeEducationData(){
        if schoolTextField.hasText {
            let schoolName = schoolTextField.text!
            user?.setSchool(newSchool: schoolName)
            user?.setEducationLevel(setLevel: self.educationLevel)
            let heightViewController = RegisterHeightViewController()
            heightViewController.user = user
            //navigationController?.popViewController(animated: true)
            navigationController?.pushViewController(heightViewController, animated: true)
        }else{
            print("Must fill in the required field")
        }
    }
    override func viewDidLayoutSubviews() {
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
    }
    /**
     An overrided method that removes the systems keyboard when any non textfield is touched.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

   

}
