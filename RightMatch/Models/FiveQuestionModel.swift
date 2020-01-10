//
//  FiveQuestionModel.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/14/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
import Firebase

class FiveQuestionModel {
    private var firstQuestion: QuestionModel?
    private var secondQuestion: QuestionModel?
    private var thirdQuestion: QuestionModel?
    private var fourthQuestion: QuestionModel?
    private var fifthQuestion: QuestionModel?
    // Array
    private var questionArray: [QuestionModel]?
    init(first: QuestionModel, second: QuestionModel, third: QuestionModel, fourth: QuestionModel, fifth: QuestionModel) {
        firstQuestion = first
        secondQuestion = second
        thirdQuestion = third
        fourthQuestion = fourth
        fifthQuestion = fifth
        
        // temp array
        questionArray = [QuestionModel]()
    }
    init() {
        
    }
    // First Question
    public func getFirstQuestion() -> QuestionModel{
        return firstQuestion!
    }
    public func setFirstQuestion(newQuestion: QuestionModel){
        firstQuestion = newQuestion
    }
    // Second Question
    public func getSecondQuestion() -> QuestionModel{
        return secondQuestion!
    }
    public func setSecondQuestion(newQuestion: QuestionModel){
        secondQuestion = newQuestion
    }
    // Third Question
    public func getThirdQuestion() -> QuestionModel{
        return thirdQuestion!
    }
    public func setThirdQuestion(newQuestion: QuestionModel){
        thirdQuestion = newQuestion
    }
    // Fourth Question
    public func getFourthQuestion() -> QuestionModel{
        return fourthQuestion!
    }
    public func setFourthQuestion(newQuestion: QuestionModel){
        fourthQuestion = newQuestion
    }
    // Fifth Question
    public func getFifthQuestion() -> QuestionModel{
        return fifthQuestion!
    }
    public func setFifthQuestion(newQuestion: QuestionModel){
        fifthQuestion = newQuestion
    }
    
    // <-------------------- Getting the questions from firebase ------------------------------>
    func getFiveQuestions(key: String){
        let documentRef = FirebaseModel.database.collection("users").document(key).collection("fiveQuestions")
        documentRef.getDocuments { (document, error) in
            
            let documents = document?.documents
            let firstQuestion = self.getQuestion(document: documents!, indexQuestion: 1, indexString: "firstQuestion")
            let secondQuestion = self.getQuestion(document: documents!, indexQuestion: 3, indexString: "secondQuestion")
            let thirdQuestion = self.getQuestion(document: documents!, indexQuestion: 4, indexString: "thirdQuestion")
            let fourthQuestion = self.getQuestion(document: documents!, indexQuestion: 2, indexString: "fourthQuestion")
            let fifthQuestion = self.getQuestion(document: documents!, indexQuestion: 0, indexString: "fifthQuestion")
            
            // Setting the questions to self
            
            self.setFirstQuestion(newQuestion: firstQuestion)
            
            self.setSecondQuestion(newQuestion: secondQuestion)
            
            self.setThirdQuestion(newQuestion: thirdQuestion)
            
            self.setFourthQuestion(newQuestion: fourthQuestion)
            
            self.setFifthQuestion(newQuestion: fifthQuestion)
           
            
        }
    }
    
    func getQuestion(document: [QueryDocumentSnapshot], indexQuestion: Int, indexString: String) -> QuestionModel{
        let documentData = document[indexQuestion].data()
        let question = QuestionModel()
        let questionString = documentData[indexString] as! String
        let aString = documentData["A"] as! String
        let bString = documentData["B"] as! String
        let cString = documentData["C"] as! String
        let dString = documentData["D"] as! String
        let rightAnswer = documentData["rightAnswer"] as! String
        question.setQuestion(newQuestion: questionString)
        question.setAnswerA(newAnswer: aString)
        question.setAnswerB(newAnswer: bString)
        question.setAnswerC(newAnswer: cString)
        question.setAnswerD(newAnswer: dString)
        question.setRightAnswerChoice(newRightAnswer: rightAnswer)
        print(question.getAnswerA())
        return question
    }
    func getSize() -> Int?{
        return questionArray?.count
    }
}
