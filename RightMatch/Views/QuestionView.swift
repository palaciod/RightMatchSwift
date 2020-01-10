//
//  QuestionView.swift
//  RightMatch
//
//  Created by Daniel Palacio on 10/9/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    let questionLabel: UILabel = {
        let question = UILabel()
        question.translatesAutoresizingMaskIntoConstraints = false
        question.text = "Question"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        question.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        question.adjustsFontSizeToFitWidth = true
        question.textAlignment = .center
        return question
    }()
    let answerALabel: AnswerView = {
        let a = AnswerView(frame: .zero)
        a.translatesAutoresizingMaskIntoConstraints = false
        a.answerLabel.text = "A"
        return a
    }()
    let answerBLabel: AnswerView = {
        let b = AnswerView(frame: .zero)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.answerLabel.text = "B"
        return b
    }()
    let answerCLabel: AnswerView = {
        let b = AnswerView(frame: .zero)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.answerLabel.text = "C"
        return b
    }()
    let answerDLabel: AnswerView = {
        let b = AnswerView(frame: .zero)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.answerLabel.text = "D"
        return b
    }()
    let answerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(questionLabel)
//        self.addSubview(answerALabel)
//        self.addSubview(answerBLabel)
//        self.addSubview(answerCLabel)
//        self.addSubview(answerDLabel)
        self.addSubview(answerStack)
        setUpQuestionLabel()
//        setUpAnswer(answerView: answerALabel, x: self.leftAnchor, y: questionLabel.bottomAnchor)
//        setUpAnswer(answerView: answerBLabel, x: self.leftAnchor, y: answerALabel.bottomAnchor)
//        setUpAnswer(answerView: answerCLabel, x: self.leftAnchor, y: answerBLabel.bottomAnchor)
//        setUpAnswer(answerView: answerDLabel, x: self.leftAnchor, y: answerCLabel.bottomAnchor)
        setUpStackView()
    }
    private func setUpQuestionLabel(){
        questionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        questionLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        questionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    private func setUpAnswer(answerView answer: AnswerView, x leftConstraint: NSLayoutXAxisAnchor, y topConstraint: NSLayoutYAxisAnchor){
        answer.leftAnchor.constraint(equalTo: leftConstraint).isActive = true
        answer.topAnchor.constraint(equalTo: topConstraint).isActive = true
        answer.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
        answer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: (2/3)*(1/4)).isActive = true
    }
    private func addSomeSpace(x leftConstraint: NSLayoutXAxisAnchor, y topConstraint: NSLayoutYAxisAnchor){
        let whiteLine = UIView(frame: .zero)
        self.addSubview(whiteLine)
        whiteLine.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        whiteLine.translatesAutoresizingMaskIntoConstraints = false
        whiteLine.leftAnchor.constraint(equalTo: leftConstraint).isActive = true
        whiteLine.topAnchor.constraint(equalTo: topConstraint).isActive = true
        whiteLine.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
        whiteLine.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
    }
    
    private func setUpStackView(){
        answerStack.addArrangedSubview(answerALabel)
        answerStack.addArrangedSubview(answerBLabel)
        answerStack.addArrangedSubview(answerCLabel)
        answerStack.addArrangedSubview(answerDLabel)
        answerStack.leftAnchor.constraint(equalTo: questionLabel.leftAnchor).isActive = true
        answerStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor).isActive = true
        answerStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3).isActive = true
        answerStack.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
