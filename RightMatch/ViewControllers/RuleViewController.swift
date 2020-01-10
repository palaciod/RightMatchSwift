//
//  RuleViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/6/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController {
    private let backButton: UIButton = {
        let back = UIButton(type: .system)
        back.translatesAutoresizingMaskIntoConstraints = false
        //back.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        back.setTitle("◀︎", for: .normal)
        back.setTitleColor(#colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1), for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
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
    private let ruleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rules: "
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    private let firstRule: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1. Create 5 multiple choice questions"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    private let secondRule: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2. Create 5 answers to those multiple choice questions"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let thirdRule: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3. Decide what is considered passing"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let fourthRule: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4. And now when anyone passes your test they get to message you"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let gotItLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Got it?"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let continueButton: UIButton = {
        let cont = UIButton(type: .system)
        cont.translatesAutoresizingMaskIntoConstraints = false
        cont.setTitle("✔︎", for: .normal)
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
    private let theRuleStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = -10
        stack.axis = .vertical
        return stack
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(backButton)
        view.addSubview(progressStatus)
        view.addSubview(ruleLabel)
        view.addSubview(theRuleStack)
        view.addSubview(continueButton)
        //view.addSubview(firstRule)
        setUpBackButton()
        setUpProgressBar()
        setUpInstructionLabel()
        setUpRules()
        setUpContinueButton()
    }
    private func setUpBackButton(){
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        backButton.heightAnchor.constraint(equalTo: progressStatus.heightAnchor).isActive = true
    }
    private func setUpProgressBar(){
        progressStatus.topAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        progressStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressStatus.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        progressStatus.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/25).isActive = true
    }
    private func setUpInstructionLabel(){
        ruleLabel.topAnchor.constraint(equalTo: progressStatus.bottomAnchor, constant: 15).isActive = true
        ruleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.2).isActive = true
        ruleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10).isActive = true
    }
    private func setUpRules(){
        
        // add the the four rule labels
        theRuleStack.addArrangedSubview(firstRule)
        theRuleStack.addArrangedSubview(secondRule)
        theRuleStack.addArrangedSubview(thirdRule)
        theRuleStack.addArrangedSubview(fourthRule)
        theRuleStack.addArrangedSubview(gotItLabel)
        // arrange the constraints
        theRuleStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        theRuleStack.topAnchor.constraint(equalTo: ruleLabel.bottomAnchor).isActive = true
        theRuleStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        theRuleStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1.5).isActive = true
    }
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        continueButton.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
    }
    @objc private func toNextPage(){
        navigationController?.setViewControllers([CreateFiveQuestionViewController()], animated: true)
    }
    override func viewDidLayoutSubviews() {
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
    }
}
