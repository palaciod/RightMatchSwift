//
//  RegisterBasicInformationViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/22/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class RegisterBasicInformationViewController: UIViewController {
    deinit {
        print("Released Basic from memory")
    }
    var user: RightMatchUser?
    
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
        page.currentPage = 1
        page.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        page.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        page.isEnabled = false
        return page
    }()
    
    // First Question
    /**
     This is a label that will contain a string that says "I am a..."
    */
    private let myGenderLabel: UILabel = {
        let myGender = UILabel()
        myGender.translatesAutoresizingMaskIntoConstraints = false
        myGender.text = "I am a..."
        //myGender.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        myGender.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        return myGender
    }()
    private let femaleButton: UIButton = {
        let female = UIButton(type: .system)
        female.translatesAutoresizingMaskIntoConstraints = false
        female.setTitle("Woman", for: .normal)
        female.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        female.layer.cornerRadius = 25
        female.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        female.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        return female
    }()
    private let maleButton: UIButton = {
        let male = UIButton(type: .system)
        male.translatesAutoresizingMaskIntoConstraints = false
        male.setTitle("Man", for: .normal)
        male.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        male.layer.cornerRadius = 25
        male.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        male.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        return male
    }()
    private var myGenderString: String = ""
    
    // Second Question
    
    private let theirGenderLabel: UILabel = {
        let theirGender = UILabel()
        theirGender.translatesAutoresizingMaskIntoConstraints = false
        theirGender.text = "I am looking for ..."
        //myGender.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        theirGender.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        return theirGender
    }()
    
    private let theyreFemaleButon: UIButton = {
        let female = UIButton(type: .system)
        female.translatesAutoresizingMaskIntoConstraints = false
        female.setTitle("Women", for: .normal)
        female.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        female.layer.cornerRadius = 25
        female.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        female.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        return female
    }()
    private let theyreMaleButton: UIButton = {
        let male = UIButton(type: .system)
        male.translatesAutoresizingMaskIntoConstraints = false
        male.setTitle("Men", for: .normal)
        male.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        male.layer.cornerRadius = 25
        male.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        male.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        return male
    }()
    private let lookingForBothGendersButton: UIButton = {
        let both = UIButton(type: .system)
        both.translatesAutoresizingMaskIntoConstraints = false
        both.setTitle("Both", for: .normal)
        both.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        both.layer.cornerRadius = 25
        both.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        both.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        return both
    }()
    private var theyreGenderString: String  = ""
    private let bdayLabel: UILabel = {
        let bday = UILabel()
        bday.translatesAutoresizingMaskIntoConstraints = false
        bday.text = "My birthday is: "
        //myGender.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        bday.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        
        return bday
    }()
    private let bdayPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        picker.layer.cornerRadius = 12
        picker.layer.masksToBounds = true
        picker.datePickerMode = UIDatePicker.Mode.date
        var dateComponents = DateComponents()
        dateComponents.year = 1897
        dateComponents.month = 1
        dateComponents.day = 1
        picker.minimumDate = Calendar.current.date(from: dateComponents)
        return picker
    }()
    private let continueButton: UIButton = {
        let cont = UIButton(type: .system)
        cont.translatesAutoresizingMaskIntoConstraints = false
        cont.setTitle("Continue", for: .normal)
        cont.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        cont.layer.cornerRadius = 12
        cont.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cont.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        return cont
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // Adding the necessary subviews
        // Navigation bar
        view.addSubview(backButton)
        view.addSubview(progressStatus)
        setUpBackButton()
        setUpProgressBar()
        // Other views
        view.addSubview(myGenderLabel)
        view.addSubview(femaleButton)
        view.addSubview(maleButton)
        view.addSubview(theirGenderLabel)
        view.addSubview(theyreFemaleButon)
        view.addSubview(theyreMaleButton)
        view.addSubview(lookingForBothGendersButton)
        view.addSubview(bdayLabel)
        view.addSubview(bdayPicker)
        view.addSubview(continueButton)
        setUpMyGenderLabel()
        setUpButtons()
        setUpTheirGenderLabel()
        setUpTheirGenderButtons()
        setUpBirthdayLabel()
        setUpBdayPicker()
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
    
    private func setUpMyGenderLabel(){
        myGenderLabel.topAnchor.constraint(equalTo: progressStatus.bottomAnchor,constant: 10).isActive = true
        myGenderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myGenderLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        myGenderLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/16).isActive = true
    }
    
    private func setUpButtons(){
        // We need to set a devider
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seperator)
        seperator.topAnchor.constraint(equalTo: myGenderLabel.bottomAnchor, constant: 30).isActive = true
        seperator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        seperator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/100).isActive = true
        seperator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // Setting up female buttons
        femaleButton.topAnchor.constraint(equalTo: myGenderLabel.bottomAnchor, constant: 30).isActive = true
        femaleButton.rightAnchor.constraint(equalTo: seperator.leftAnchor, constant: -20).isActive = true
        femaleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        femaleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        femaleButton.addTarget(self, action: #selector(femaleButtonTurnRed), for: .touchUpInside)
        // Setting up male buttons
        maleButton.topAnchor.constraint(equalTo: myGenderLabel.bottomAnchor, constant: 30).isActive = true
        maleButton.leftAnchor.constraint(equalTo: seperator.rightAnchor, constant: 20).isActive = true
        maleButton.widthAnchor.constraint(equalTo: femaleButton.widthAnchor).isActive = true
        maleButton.heightAnchor.constraint(equalTo: femaleButton.heightAnchor).isActive = true
        maleButton.addTarget(self, action: #selector(maleButtonTurnBlue), for: .touchUpInside)
    }
    @objc private func maleButtonTurnBlue(){
        maleButton.backgroundColor = #colorLiteral(red: 0.05490196078, green: 0.07843137255, blue: 0.3921568627, alpha: 1)
        maleButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        femaleButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        femaleButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        myGenderString = "male"
    }
    @objc private func femaleButtonTurnRed(){
        femaleButton.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        femaleButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        maleButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        maleButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        myGenderString = "female"
    }
    
    private func setUpTheirGenderLabel(){
        theirGenderLabel.topAnchor.constraint(equalTo: femaleButton.bottomAnchor, constant: 30).isActive = true
        theirGenderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        theirGenderLabel.widthAnchor.constraint(equalTo: myGenderLabel.widthAnchor).isActive = true
        theirGenderLabel.heightAnchor.constraint(equalTo: myGenderLabel.heightAnchor).isActive = true
    }
    
    private func setUpTheirGenderButtons(){
        // Female setup
        theyreFemaleButon.topAnchor.constraint(equalTo: theirGenderLabel.bottomAnchor, constant: 30).isActive = true
        theyreFemaleButon.rightAnchor.constraint(equalTo: theyreMaleButton.leftAnchor, constant: -20).isActive = true
        theyreFemaleButon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        theyreFemaleButon.heightAnchor.constraint(equalTo: femaleButton.heightAnchor).isActive = true
        theyreFemaleButon.addTarget(self, action: #selector(theyreFemaleButtonTurnRed), for: .touchUpInside)
        // male setup
        theyreMaleButton.topAnchor.constraint(equalTo: theirGenderLabel.bottomAnchor, constant: 30).isActive = true
        theyreMaleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        theyreMaleButton.widthAnchor.constraint(equalTo: theyreFemaleButon.widthAnchor).isActive = true
        theyreMaleButton.heightAnchor.constraint(equalTo: theyreFemaleButon.heightAnchor).isActive = true
        theyreMaleButton.addTarget(self, action: #selector(theyreMaleButtonTurnBlue), for: .touchUpInside)
        // Both setup
        lookingForBothGendersButton.topAnchor.constraint(equalTo: theyreFemaleButon.topAnchor).isActive = true
        lookingForBothGendersButton.leftAnchor.constraint(equalTo: theyreMaleButton.rightAnchor, constant: 20).isActive = true
        lookingForBothGendersButton.widthAnchor.constraint(equalTo: theyreFemaleButon.widthAnchor).isActive = true
        lookingForBothGendersButton.heightAnchor.constraint(equalTo: theyreFemaleButon.heightAnchor).isActive = true
        lookingForBothGendersButton.addTarget(self, action: #selector(bothGenderButtonTurnsPurple), for: .touchUpInside)
    }
    private func setUpBirthdayLabel(){
        bdayLabel.topAnchor.constraint(equalTo: theyreFemaleButon.bottomAnchor, constant: 30).isActive = true
        bdayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bdayLabel.widthAnchor.constraint(equalTo: myGenderLabel.widthAnchor).isActive = true
        bdayLabel.heightAnchor.constraint(equalTo: myGenderLabel.heightAnchor).isActive = true
        
    }
    private func setUpBdayPicker(){
        bdayPicker.topAnchor.constraint(equalTo: bdayLabel.bottomAnchor, constant: 30).isActive = true
        bdayPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bdayPicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        bdayPicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/8).isActive = true
    }
    @objc private func theyreFemaleButtonTurnRed(){
        theyreFemaleButon.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        theyreFemaleButon.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        theyreMaleButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        theyreMaleButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        lookingForBothGendersButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        lookingForBothGendersButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        theyreGenderString = "female"
    }
    @objc private func theyreMaleButtonTurnBlue(){
        theyreMaleButton.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.07843137255, blue: 0.3921568627, alpha: 1)
        theyreMaleButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        theyreFemaleButon.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        theyreFemaleButon.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        lookingForBothGendersButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        lookingForBothGendersButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        theyreGenderString = "male"
    }
    @objc private func bothGenderButtonTurnsPurple(){
        lookingForBothGendersButton.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.03921568627, blue: 0.3529411765, alpha: 1)
        lookingForBothGendersButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        theyreFemaleButon.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        theyreFemaleButon.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        theyreMaleButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        theyreMaleButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        theyreGenderString = "both"
    }
    private func setUpContinueButton(){
        continueButton.topAnchor.constraint(equalTo: bdayPicker.bottomAnchor, constant: 35).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        continueButton.heightAnchor.constraint(equalTo: bdayPicker.heightAnchor, multiplier: 1/2).isActive = true
        continueButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    @objc func nextPage(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: bdayPicker.date)
        dateFormatter.dateFormat = "MM"
        let month = dateFormatter.string(from: bdayPicker.date)
        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: bdayPicker.date)
        user?.setYear(newYear: year)
        user?.setMonth(newMonth: month)
        user?.setDay(newDay: day)
        user?.setAge(newAge: (user?.createAge())!)
        user?.setMyGender(newGender: myGenderString)
        user?.setTheirGender(newGender: theyreGenderString)
//        print("<---------------->")
//        let docData: [String: Any] = [
//            "gender" : "male",
//            "theirGender" : "female",
//            "year" : year,
//            "month" : month,
//            "day" : day
//        ]
//        FirebaseModel.db.collection("users").document(FirebaseModel.userID!).setData(docData) { error in
//            if let error = error {
//                print(error.localizedDescription)
//                print("Failed to write to Fire Store")
//            }else {
//                print("Success writing to Fire Store")
//            }
//        }
        let educationPage = RegisterEducationViewController()
        educationPage.user = user
        navigationController?.pushViewController(educationPage, animated: true)
    }
    
    
    

}
