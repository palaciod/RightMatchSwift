//
//  MultipleChoiceQuestionView.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/6/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class MultipleChoiceQuestionView: UIView {
    var index = 1
    var rightAnswer: String = ""
    let indexQuestion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.text = "First Question"
        label.textAlignment = .center
        return label
    }()
    private let topLineSep: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return line
    }()
    let question: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        text.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return text
    }()
    private let firstAnswer: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle( "   A.   ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    let aTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Fill in choice A"
        textField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return textField
    }()
    private let secondAnswer: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("   B.   ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    let bTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Fill in choice B"
        textField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return textField
    }()
    private let thirdAnswer: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("   C.   ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    let cTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Fill in choice C"
        textField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return textField
    }()
    private let fourthAnswer: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("   D.   ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    let dTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Fill in choice D"
        textField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return textField
    }()
    private let rowAnswerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()
    private let answerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()
    private let lineSeparator: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(indexQuestion)
        self.addSubview(question)
        self.addSubview(topLineSep)
        self.addSubview(answerStack)
        self.addSubview(lineSeparator)
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.layer.cornerRadius = 12
        setUpIndexQuestion()
        setUpQuestionTextView()
        setUpAnswerStack()
        setUpAnswers()
        setUpLines()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpIndexQuestion(){
        indexQuestion.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        indexQuestion.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indexQuestion.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        indexQuestion.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/8).isActive = true
    }
    private func setUpQuestionTextView(){
        question.topAnchor.constraint(equalTo: indexQuestion.bottomAnchor).isActive = true
        question.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        question.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        question.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3/8).isActive = true
    }
    private func setUpAnswerStack(){
        answerStack.topAnchor.constraint(equalTo: question.bottomAnchor).isActive = true
        answerStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        answerStack.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        answerStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2).isActive = true
    }
    private func setUpAnswers(){
        let firstRow = UIStackView(arrangedSubviews: [firstAnswer,aTextField])
        firstAnswer.addTarget(self, action: #selector(aIsCorrect), for: .touchUpInside)
        answerStack.addArrangedSubview(firstRow)
        let secondRow = UIStackView(arrangedSubviews: [secondAnswer,bTextField])
        secondAnswer.addTarget(self, action: #selector(bIsCorrect), for: .touchUpInside)
        answerStack.addArrangedSubview(secondRow)
        let thirdRow = UIStackView(arrangedSubviews: [thirdAnswer,cTextField])
        thirdAnswer.addTarget(self, action: #selector(cIsCorrect), for: .touchUpInside)
        answerStack.addArrangedSubview(thirdRow)
        let fourthRow = UIStackView(arrangedSubviews: [fourthAnswer,dTextField])
        fourthAnswer.addTarget(self, action: #selector(dIsCorrect), for: .touchUpInside)
        answerStack.addArrangedSubview(fourthRow)
    }
    @objc private func aIsCorrect(){
        rightAnswer = "a"
        firstAnswer.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
        secondAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        thirdAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        fourthAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    }
    @objc private func bIsCorrect(){
        rightAnswer = "b"
        secondAnswer.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
        firstAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        thirdAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        fourthAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    }
    @objc private func cIsCorrect(){
        rightAnswer = "c"
        thirdAnswer.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
        secondAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        firstAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        fourthAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    }
    @objc private func dIsCorrect(){
        rightAnswer = "d"
        fourthAnswer.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
        secondAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        firstAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        thirdAnswer.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    }
    private func setUpLines(){
        // The first line
        topLineSep.topAnchor.constraint(equalTo: indexQuestion.bottomAnchor).isActive = true
        topLineSep.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        topLineSep.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        topLineSep.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/200).isActive = true
        // The Second Line
        lineSeparator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lineSeparator.centerYAnchor.constraint(equalTo: question.bottomAnchor).isActive = true
        lineSeparator.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        lineSeparator.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/200).isActive = true
        
    }
    

}
