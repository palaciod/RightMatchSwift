//
//  UserProfile.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/23/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
import UIKit
struct UserProfile {
    // The list of images that the user has
    // User profile will also contain  the instagram pictures grabbed from the fbsdk. First ill check if i cant create a basic user profile UI
    private let key: String?
    private var user: RightMatchUser?
    private var images: URLS?
    private let questions: FiveQuestionModel?
    
    
    var items = ItemStack()
    var urls = [URL]()
    init(_user: RightMatchUser, _key: String) {
        user = _user
        key = _key
        images = URLS(_key: key!)
        
        // Everytime we initialize our class we grab tbe urls from firebase storage
        
        images?.getFirstPictureUrl()
        images?.getSecondPictureUrl()
        images?.getThirdPicture()
        images?.getFourthPicture()
        images?.getFifthPicture()
        images?.getSixthPicture()
        // Grabbing the questions from firebase
        questions = FiveQuestionModel()
        questions?.getFiveQuestions(key: key!)
        
        
        // array of urls
        
        
    }
    public func getUser() -> RightMatchUser{
        return user!
    }
    mutating public func setUser(newUser: RightMatchUser){
        user = newUser
    }
    public func getImages() -> URLS{
        return images!
    }
    public func getQuestions() -> FiveQuestionModel{
        return questions ?? FiveQuestionModel()
    }
    public func checkEmptyURLS() -> Int{
        var urlCount = 0
        if images?.firstPicture != nil {
            urlCount += 1
            
        }
        if images?.secondPicture != nil {
            urlCount += 1
        }
        if images?.thirdPicture != nil {
            urlCount += 1
        }
        if images?.fourthPicture != nil {
            urlCount += 1
        }
        if images?.fifthPicture != nil {
            urlCount += 1
        }
        if images?.sixthPicture != nil {
            urlCount += 1
        }
        
        return urlCount
    }
    public func checkForEmptyQuestions() -> Int{
        var questionCount = 0
        if questions?.getFirstQuestion().getQuestion() != "" {
            questionCount += 1
        }
        if questions?.getSecondQuestion().getQuestion() != "" {
            questionCount += 1
        }
        if questions?.getThirdQuestion().getQuestion() != ""{
            questionCount += 1
        }
        if questions?.getFourthQuestion().getQuestion() != "" {
            questionCount += 1
        }
        if questions?.getFifthQuestion().getQuestion() != "" {
            questionCount += 1
        }
        
        return questionCount
    }
    public func setUpItemQueue(){
        
        if images?.firstPicture != nil {
            items.push(images?.firstPicture)
        }
        if questions?.getFirstQuestion().getQuestion() != "" {
            
            items.push(questions?.getFirstQuestion())
        }
        if images?.secondPicture != nil {
            
            items.push(images?.secondPicture)
        }
        if questions?.getSecondQuestion().getQuestion() != "" {
           
            items.push(questions?.getSecondQuestion())
        }
        if images?.thirdPicture != nil {
            
            items.push(images?.thirdPicture)
        }
        if questions?.getThirdQuestion().getQuestion() != "" {
           
            items.push(questions?.getThirdQuestion())
        }
        if images?.fourthPicture != nil {
            
            items.push(images?.fourthPicture)
        }
        if questions?.getFourthQuestion().getQuestion() != "" {
            
            items.push(questions?.getFourthQuestion())
        }
        if images?.fifthPicture != nil {
            
            items.push(images?.fifthPicture)
        }
        if questions?.getFifthQuestion().getQuestion() != "" {
            
            items.push(questions?.getFifthQuestion())
        }
        if images?.sixthPicture != nil {
            
            items.push(images?.sixthPicture)
        }
        
        
    }
    public func profileSize() -> Int {
        return checkForEmptyQuestions() + checkEmptyURLS()
    }
    
    
    
    
    
    
    
    
    
    
    
}
