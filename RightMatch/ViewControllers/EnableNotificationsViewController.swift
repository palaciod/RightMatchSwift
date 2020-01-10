//
//  EnableNotificationsViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/9/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class EnableNotificationsViewController: UIViewController {
    deinit {
        print("Releasing ENableNotificationViewController from memory")
    }
    private let backButton: UIButton = {
        let back = UIButton(type: .system)
        back.translatesAutoresizingMaskIntoConstraints = false
        //back.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        back.setTitle("<", for: .normal)
        back.setTitleColor(#colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1), for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        return back
    }()
    private let progressStatus: UIPageControl = {
        let page = UIPageControl(frame: .zero)
        page.translatesAutoresizingMaskIntoConstraints = false
        page.numberOfPages = 5
        page.currentPage = 0
        page.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        page.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        page.isEnabled = false
        return page
    }()
    private let notifyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Get notified when your next date is around the corner"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    private let enableButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enable Notifications", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    private let disableButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Disable Notifications", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
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
        return cont
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(backButton)
        view.addSubview(progressStatus)
        view.addSubview(notifyLabel)
        view.addSubview(enableButton)
        view.addSubview(disableButton)
        view.addSubview(continueButton)
        setUpBackButton()
        setUpProgressBar()
        setUpNotifyLabel()
        setUpButtons()
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
    private func setUpNotifyLabel(){
        notifyLabel.topAnchor.constraint(equalTo: progressStatus.bottomAnchor, constant: 15).isActive = true
        notifyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notifyLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        notifyLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10).isActive = true
    }
    private func setUpButtons(){
        // Enable button
        enableButton.topAnchor.constraint(equalTo: notifyLabel.bottomAnchor, constant: 20).isActive = true
        enableButton.leftAnchor.constraint(equalTo: notifyLabel.leftAnchor).isActive = true
        enableButton.widthAnchor.constraint(equalTo: notifyLabel.widthAnchor, multiplier: 1/2).isActive = true
        enableButton.heightAnchor.constraint(equalTo: notifyLabel.heightAnchor, multiplier: 1/2).isActive = true
        enableButton.addTarget(self, action: #selector(enableButtonPressed), for: .touchUpInside)
        // Disable Button
        disableButton.topAnchor.constraint(equalTo: enableButton.bottomAnchor, constant: 15).isActive = true
        disableButton.leftAnchor.constraint(equalTo: enableButton.leftAnchor).isActive = true
        disableButton.widthAnchor.constraint(equalTo: enableButton.widthAnchor).isActive = true
        disableButton.heightAnchor.constraint(equalTo: enableButton.heightAnchor).isActive = true
        disableButton.addTarget(self, action: #selector(disableButtonPressed), for: .touchUpInside)
    }
    @objc private func disableButtonPressed(){
        disableButton.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        disableButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        enableButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        enableButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    }
    @objc private func enableButtonPressed(){
        enableButton.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        enableButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        disableButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        disableButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    }
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        // Adding the target to the continue button
        continueButton.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
        
    }
    @objc private func toNextPage(){
        let statusDoc: [String: Any] = [
            "status" : "Done"
        ]
        FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("completion").document("status").setData(statusDoc){ error in
            if let error = error {
                print(error.localizedDescription)
                print("Failed to write to Fire Store")
            }else {
                print("Success writing to Fire Store")
            }
        }
        navigationController?.setViewControllers([RecyclcerViewController()], animated: true)
    }
    override func viewDidLayoutSubviews() {
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
        disableButton.layer.cornerRadius = disableButton.bounds.size.height/2
        enableButton.layer.cornerRadius = enableButton.bounds.size.height/2
    }

    

}
