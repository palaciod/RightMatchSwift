//
//  CreateFiveQuestionViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/6/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class CreateFiveQuestionViewController: UIViewController, UITextFieldDelegate {
    deinit {
        print("Releasing Question Creation from memory")
    }
    var fiveQuestions: FiveQuestionModel?
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
    private let question: MultipleChoiceQuestionView = {
        let question = MultipleChoiceQuestionView(frame: .zero)
        question.translatesAutoresizingMaskIntoConstraints = false
        return question
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
        //view.addSubview(questionStack)
        view.addSubview(backButton)
        view.addSubview(progressStatus)
        view.addSubview(question)
        view.addSubview(continueButton)
        setUpBackButton()
        setUpProgressBar()
        setUpQuestion()
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
    private func setUpQuestion(){
        question.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        question.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        question.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        question.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
    }
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        // Adding the target to the continue button
        continueButton.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
    }
    private func checkForEmptyTextFields() -> Bool{
        let questionString: String = question.question.text
        let a: String = question.aTextField.text ?? ""
        let b: String = question.bTextField.text ?? ""
        let c: String = question.cTextField.text ?? ""
        let d: String = question.dTextField.text ?? ""
        if !a.isEmpty || !b.isEmpty || !c.isEmpty || !d.isEmpty {
            if questionString.isEmpty {
                print("Must create a Question")
                let alert = UIAlertController(title: "Please create a question", message: "Questions are not allowed to be empty if there are answers.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil)
                    print("ok")
                    
                }))
                self.present(alert, animated: true, completion: nil)
                return true
            }
        }
        if !questionString.isEmpty {
            if a.isEmpty && b.isEmpty && c.isEmpty && d.isEmpty {
                print("Must fill in at least one answer")
                let alert = UIAlertController(title: "Please fill in at least one answer", message: "Each question should have at least one answer.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil)
                    print("ok")
                    
                }))
                self.present(alert, animated: true, completion: nil)
                return true
            }
        }
        return false
    }
    // A function to check if an entire question is empty. Only for first question
    private func emptyQuestion() -> Bool{
        let questionString: String = question.question.text
        if questionString.isEmpty {
            let alert = UIAlertController(title: "Please fill in at least one question.", message: "Each profile requires one quesrtion.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
                print("ok")
                
            }))
            self.present(alert, animated: true, completion: nil)
            return true
        }
        return false
    }
    override func viewDidLayoutSubviews() {
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
    }
    @objc private func toNextPage(){
        let questionModel = QuestionModel()
        questionModel.setQuestion(newQuestion: question.question.text)
        questionModel.setAnswerA(newAnswer: question.aTextField.text!)
        questionModel.setAnswerB(newAnswer: question.bTextField.text!)
        questionModel.setAnswerC(newAnswer: question.cTextField.text!)
        questionModel.setAnswerD(newAnswer: question.dTextField.text!)
        questionModel.setRightAnswerChoice(newRightAnswer: question.rightAnswer)
        let nextPage = CreateFiveQuestionViewController()
        let index = question.index
        switch index {
        case 1:
            nextPage.question.index = 2
            nextPage.question.indexQuestion.text = "Second Question"
            // Initialize the five question model
            fiveQuestions = FiveQuestionModel(first: questionModel, second: QuestionModel(), third: QuestionModel(), fourth: QuestionModel(), fifth: QuestionModel())
            nextPage.fiveQuestions = self.fiveQuestions
            if !checkForEmptyTextFields() {
                if !emptyQuestion() {
                    navigationController?.pushViewController(nextPage, animated: true)
                }
                
            }
            break
        case 2:
            nextPage.question.index = 3
            nextPage.question.indexQuestion.text = "Third Question"
            fiveQuestions?.setSecondQuestion(newQuestion: questionModel)
            nextPage.fiveQuestions = self.fiveQuestions
            if !checkForEmptyTextFields() {
                navigationController?.pushViewController(nextPage, animated: true)
            }
            break
        case 3:
            nextPage.question.index = 4
            nextPage.question.indexQuestion.text = "Fourth Question"
            fiveQuestions?.setThirdQuestion(newQuestion: questionModel)
            nextPage.fiveQuestions = self.fiveQuestions
            if !checkForEmptyTextFields() {
                navigationController?.pushViewController(nextPage, animated: true)
            }
            break
        case 4:
            nextPage.question.index = 5
            nextPage.question.indexQuestion.text = "Fifth Question"
            fiveQuestions?.setFourthQuestion(newQuestion: questionModel)
            nextPage.fiveQuestions = self.fiveQuestions
            if !checkForEmptyTextFields() {
                navigationController?.pushViewController(nextPage, animated: true)
            }
            break
        case 5:
            fiveQuestions?.setFifthQuestion(newQuestion: questionModel)
            if !checkForEmptyTextFields() {
                let firstQuestionDoc: [String: Any] = [
                    "firstQuestion" : fiveQuestions!.getFirstQuestion().getQuestion(),
                    "A": fiveQuestions!.getFirstQuestion().getAnswerA(),
                    "B": fiveQuestions!.getFirstQuestion().getAnswerB(),
                    "C": fiveQuestions!.getFirstQuestion().getAnswerC(),
                    "D": fiveQuestions!.getFirstQuestion().getAnswerD(),
                    "rightAnswer": fiveQuestions!.getFirstQuestion().getRightAnswerChoice()
                ]
                let secondQuestionDoc: [String: Any] = [
                    "secondQuestion" : fiveQuestions!.getSecondQuestion().getQuestion(),
                    "A": fiveQuestions!.getSecondQuestion().getAnswerA(),
                    "B": fiveQuestions!.getSecondQuestion().getAnswerB(),
                    "C": fiveQuestions!.getSecondQuestion().getAnswerC(),
                    "D": fiveQuestions!.getSecondQuestion().getAnswerD(),
                    "rightAnswer": fiveQuestions!.getSecondQuestion().getRightAnswerChoice()
                ]
                let thirdQuestionDoc: [String: Any] = [
                    "thirdQuestion" : fiveQuestions!.getThirdQuestion().getQuestion(),
                    "A": fiveQuestions!.getThirdQuestion().getAnswerA(),
                    "B": fiveQuestions!.getThirdQuestion().getAnswerB(),
                    "C": fiveQuestions!.getThirdQuestion().getAnswerC(),
                    "D": fiveQuestions!.getThirdQuestion().getAnswerD(),
                    "rightAnswer": fiveQuestions!.getThirdQuestion().getRightAnswerChoice()
                ]
                let fourthQuestionDoc: [String: Any] = [
                    "fourthQuestion" : fiveQuestions!.getFourthQuestion().getQuestion(),
                    "A": fiveQuestions!.getFourthQuestion().getAnswerA(),
                    "B": fiveQuestions!.getFourthQuestion().getAnswerB(),
                    "C": fiveQuestions!.getFourthQuestion().getAnswerC(),
                    "D": fiveQuestions!.getFourthQuestion().getAnswerD(),
                    "rightAnswer": fiveQuestions!.getFourthQuestion().getRightAnswerChoice()
                ]
                let fifthQuestionDoc: [String: Any] = [
                    "fifthQuestion" : fiveQuestions!.getFifthQuestion().getQuestion(),
                    "A": fiveQuestions!.getFifthQuestion().getAnswerA(),
                    "B": fiveQuestions!.getFifthQuestion().getAnswerB(),
                    "C": fiveQuestions!.getFifthQuestion().getAnswerC(),
                    "D": fiveQuestions!.getFifthQuestion().getAnswerD(),
                    "rightAnswer": fiveQuestions!.getFifthQuestion().getRightAnswerChoice()
                ]
                // Adding First Questions
                FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("fiveQuestions").document("firstQuestion").setData(firstQuestionDoc){ error in
                    if let error = error {
                        print(error.localizedDescription)
                        print("Failed to write to Fire Store")
                    }else {
                        print("Success writing to Fire Store")
                    }
                    
                }
                // Adding Second Questions
                FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("fiveQuestions").document("secondQuestion").setData(secondQuestionDoc){ error in
                    if let error = error {
                        print(error.localizedDescription)
                        print("Failed to write to Fire Store")
                    }else {
                        print("Success writing to Fire Store")
                    }
                    
                }
                
                // Adding Third Questions
                FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("fiveQuestions").document("thirdQuestion").setData(thirdQuestionDoc){ error in
                    if let error = error {
                        print(error.localizedDescription)
                        print("Failed to write to Fire Store")
                    }else {
                        print("Success writing to Fire Store")
                    }
                    
                }
                // Adding Fourth Questions
                FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("fiveQuestions").document("fourthQuestion").setData(fourthQuestionDoc){ error in
                    if let error = error {
                        print(error.localizedDescription)
                        print("Failed to write to Fire Store")
                    }else {
                        print("Success writing to Fire Store")
                    }
                    
                }
                // Adding Fifth Questions
                FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("fiveQuestions").document("fifthQuestion").setData(fifthQuestionDoc){ error in
                    if let error = error {
                        print(error.localizedDescription)
                        print("Failed to write to Fire Store")
                    }else {
                        print("Success writing to Fire Store")
                    }
                    
                }
                navigationController?.setViewControllers([PictureGalleryViewController()], animated: true)
            }
            break
        default:
            break
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    

}
