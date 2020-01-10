//
//  QuestionModel.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/14/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
class QuestionModel {
    var index = 0
    private var question = ""
    private var answerA = ""
    private var answerB = ""
    private var answerC = ""
    private var answerD = ""
    private var rightAnswerChoice = "'"
    init() {
        
    }
    public func getQuestion() -> String{
        return question
    }
    public func setQuestion(newQuestion: String){
        question = newQuestion
    }
    public func getAnswerA() -> String {
        return answerA
    }
    public func setAnswerA(newAnswer: String){
        answerA = newAnswer
    }
    public func getAnswerB() -> String {
        return answerB
    }
    public func setAnswerB(newAnswer: String){
        answerB = newAnswer
    }
    public func getAnswerC() -> String {
        return answerC
    }
    public func setAnswerC(newAnswer: String){
        answerC = newAnswer
    }
    public func getAnswerD() -> String {
        return answerD
    }
    public func setAnswerD(newAnswer: String){
        answerD = newAnswer
    }
    public func getRightAnswerChoice() -> String {
        return rightAnswerChoice
    }
    public func setRightAnswerChoice(newRightAnswer: String){
        rightAnswerChoice = newRightAnswer
    }
    
    // we will get and set an index
    public func getIndex() -> Int {
        return index
    }
    public func setIndex(newIndex: Int){
        index = newIndex
    }
}
