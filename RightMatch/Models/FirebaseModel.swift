//
//  FirebaseModel.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/15/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import Geofirestore
import Kingfisher
struct FirebaseModel {
    //static let docRef: DocumentReference!
    static let database = Firestore.firestore()
    static let userID = Auth.auth().currentUser?.uid
    static let storeage = Storage.storage()
    /**
     A method exposed to objective-c that will either log in the user to their profile's StackViewController or fail to log in if user's information is
     incorrect.
     */
    func getRightMatchUser(recycler: RecyclcerViewController){
        let docRef = FirebaseModel.database.collection("users")
        docRef.document(FirebaseModel.userID!).collection("accountDetails").document("generalUserInformation").getDocument { (doc, err) in
            if doc ==  doc, doc!.exists {
                print(true)
                let myName: String = doc?.data()!["name"] as! String
                let myAge: Int = doc?.data()!["age"] as! Int
                let year: String = doc?.data()!["year"] as! String
                let month: String = doc?.data()!["month"] as! String
                let day: String = doc?.data()!["day"] as! String
                let myGender: String = doc?.data()!["gender"] as! String
                let school: String = doc?.data()!["name"] as! String
                let educationLevel: String = doc?.data()!["name"] as! String
                let theirGender: String = doc?.data()!["theirGender"] as! String
                let height: String = doc?.data()!["height"] as! String
                // Right Match User.. add height to the intializer
                let user = RightMatchUser(_name: myName, _year: year, _month: month, _day: day, _age: myAge, _myGender: myGender, _theirGender: theirGender, _school: school, _educationLevel: educationLevel, lat: 0.0, long: 0.0)
                // Height setter and getter
                user.setInchHeight(newHeight: "")
                user.setFeetHeight(newHeight: height)
                recycler.rightMatchUser = user
                
            }else{
                print(false)
            }
        }
    }
    
    
    
    
    func login(navigator: UINavigationController, email: String, password: String, stackController: StackViewController){
        //FirebaseModel.database.collection("users").g
        
        if(email.isEmpty ||  password.isEmpty){
            print("Must fill in all text fields.")
        }else{
            print("All text fields are filled in ")
            Auth.auth().signIn(withEmail: email, password: password){  (user, error) in
                if error == nil {
                    print("You successfully logged in!!")
                    let docRef = FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("accountDetails").document("generalUserInformation")
                    // If the account details document exists then we must check if the five question document exists. If it does then we will transition to the picture gallery view controller, if not then we navigate to the rules view controller since none of the questions have been recorded.
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
                            
                            // Must be set to the rule view controller
                            let fiveQuestionDoc = FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("fiveQuestions").document("firstQuestion")
                            fiveQuestionDoc.getDocument(completion: { (document, error) in
                                if let document = document, document.exists {
                                    let completionDoc = FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("completion").document("status")
                                    
                                    completionDoc.getDocument(completion: { (document, error) in
                                        if let document = document, document.exists {
                                            navigator.setViewControllers([RecyclcerViewController()], animated: true)
                                        }else{
                                            navigator.setViewControllers([PictureGalleryViewController()], animated: true)
                                        }
                                    })
                                    //navigator.setViewControllers([PictureGalleryViewController()], animated: true)
                                }else{
                                    navigator.setViewControllers([RuleViewController()], animated: true)
                                }
                            })
                            
                            
                        }else{
                            
                            navigator.setViewControllers([RegisterNameViewController()], animated: true)
                        }
                    }
                }else{
                    print("Failed to log in :(")
                }
                
            }
        }
    }
    /**
     A signout method that is current placed in stack controller, should be place in a settings UIViewController
    */
    func signOut(stackController: StackViewController){
        if Auth.auth().currentUser != nil {
            do{
                try Auth.auth().signOut()
                print("Successfully logged out")
                let loginController = LogInViewController()
                stackController.present(loginController, animated: true, completion: nil)
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    /**
     A method exposed to objective-c that will check the user's signin status. If the user is signed in then the User's StackViewController will be
     presented.
     */
    func userSignInStatus(navigator: UINavigationController){
        print("<--------------------------->")
        if let user = Auth.auth().currentUser{
            print("User is signed in. User is: " + user.email!)
            let docRef = FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("accountDetails").document("generalUserInformation")
            // If the account details document exists then we must check if the five question document exists. If it does then we will transition to the picture gallery view controller, if not then we navigate to the rules view controller since none of the questions have been recorded.
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    
                    // Must be set to the rule view controller
                    let fiveQuestionDoc = FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("fiveQuestions").document("firstQuestion")
                    fiveQuestionDoc.getDocument(completion: { (document, error) in
                        if let document = document, document.exists {
                            let completionDoc = FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("completion").document("status")
                            
                            completionDoc.getDocument(completion: { (document, error) in
                                if let document = document, document.exists {
                                    navigator.setViewControllers([RecyclcerViewController()], animated: true)
                                }else{
                                    navigator.setViewControllers([PictureGalleryViewController()], animated: true)
                                }
                            })
                            //navigator.setViewControllers([PictureGalleryViewController()], animated: true)
                        }else{
                            navigator.setViewControllers([RuleViewController()], animated: true)
                        }
                    })
                    
                    
                }else{
                    
                    navigator.setViewControllers([RegisterNameViewController()], animated: true)
                }
            }
        }else {
            print("User is not signed in")
        }
    }
    
    
    func accountCreationIsComplete(){
       
    }
    
    func upLoadImageToStorage(image: UIImage, indexOfImage: String){
        let jpegData = image.jpegData(compressionQuality: 1.0)
        let imageReference = FirebaseModel.storeage.reference().child("users").child(FirebaseModel.userID!).child("pictures").child(indexOfImage)
        imageReference.putData(jpegData!, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Failed to upload image")
                print(error.localizedDescription)
            }else{
                imageReference.downloadURL(completion: { (url, error) in
                    if let error = error {
                        print("failed to download url")
                        print(error.localizedDescription)
                    }else{
                        guard url != nil else{
                            print("URL failed")
                            return
                        }
                        print("Successful write to Firebase Storage")
                    }
                })
            }
            
        }
    }

    func getFiveQuestions(key: String) -> FiveQuestionModel{
        var fiveQuestions: FiveQuestionModel?
        let documentRef = FirebaseModel.database.collection("users").document(key).collection("fiveQuestions")
        documentRef.getDocuments { (document, error) in
            
            let documents = document?.documents
            let firstQuestion = self.getQuestion(document: documents!, indexQuestion: 1, indexString: "firstQuestion")
            let secondQuestion = self.getQuestion(document: documents!, indexQuestion: 3, indexString: "secondQuestion")
            let thirdQuestion = self.getQuestion(document: documents!, indexQuestion: 4, indexString: "thirdQuestion")
            let fourthQuestion = self.getQuestion(document: documents!, indexQuestion: 2, indexString: "fourthQuestion")
            let fifthQuestion = self.getQuestion(document: documents!, indexQuestion: 0, indexString: "fifthQuestion")
            fiveQuestions = FiveQuestionModel(first: firstQuestion, second: secondQuestion, third: thirdQuestion, fourth: fourthQuestion, fifth: fifthQuestion)
        }
        return fiveQuestions ?? FiveQuestionModel()
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
    // <------------------- STARt OF GETSTACK  --------------------->
    func getPotentialMatches() -> StackModel{
        let stackOfProfiles = StackModel()
        let docRef = FirebaseModel.database.collection("users")
        let geoRef = GeoFirestore(collectionRef: docRef)
        // Getting the users gender. Note this should be grabbed from the database once, not everytime the recyvler is popped from the navigation controller
        
        let firstGeoPoint = GeoPoint(latitude: 40.757674411216904, longitude: -73.83521032677875)
        let circleQ = geoRef.query(withCenter: firstGeoPoint, radius: 1.0)
        
        
        // Getting the potential matches
        circleQ.observe(.documentEntered) { (key, location) in
            let ref = docRef.document(key!)
            ref.collection("accountDetails").document("generalUserInformation").getDocument(completion: { (document, error) in
                if let document = document , document.exists {
                    // The document data specified by the key
                    let documentData = document.data()
                    // Empty Image Array
                    
                    // Getting the rightMatchUser class set up
                    let myName: String = documentData!["name"] as! String
                    let myAge: Int = documentData!["age"] as! Int
                    let year: String = documentData!["year"] as! String
                    let month: String = documentData!["month"] as! String
                    let day: String = documentData!["day"] as! String
                    let myGender: String = documentData!["gender"] as! String
                    let school: String = documentData!["name"] as! String
                    let educationLevel: String = documentData!["name"] as! String
                    let theirGender: String = documentData!["theirGender"] as! String
                    let height: String = documentData!["height"] as! String
                    // Right Match User.. add height to the intializer
                    let user = RightMatchUser(_name: myName, _year: year, _month: month, _day: day, _age: myAge, _myGender: myGender, _theirGender: theirGender, _school: school, _educationLevel: educationLevel, lat: 0.0, long: 0.0)
                    // Height setter and getter
                    user.setInchHeight(newHeight: "")
                    user.setFeetHeight(newHeight: height)
                    // Creating UserProfile that will contain the rightMatchUser and the users images.
                    let visualProfile = UserProfile(_user: user, _key: key!)
                    
                    stackOfProfiles.push(visualProfile)
                }else{
                    print(key!)
                    print("Document does not exist")
                }
            })
            
        }
        return stackOfProfiles
    }
    // <------------------- END OF GETSTACK  --------------------->
   
    
    
   // End of class
}
