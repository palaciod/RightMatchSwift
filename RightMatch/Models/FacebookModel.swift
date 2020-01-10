//
//  FacebookModel.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/20/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import Firebase
struct FacebookModel{
    
    private let loginManager: LoginManager = {
        let manager = LoginManager()
        return manager
    }()
    
    
    func logout(){
        loginManager.logOut()
    }
    
    func userSignInStatus(loginController: UINavigationController){
        if AccessToken.isCurrentAccessTokenActive{
            print("User is signed in")
            loginController.present(StackViewController(), animated: true, completion: nil)
            loginController.setViewControllers([StackViewController()], animated: true)
        }
    }
    
    
    
    
     func logIn(loginController: UINavigationController){
        loginManager.logIn(permissions: ["email"], from: loginController) { (result, error) in
            if error == nil {
                if result!.isCancelled{
                    return
                }
                if result!.grantedPermissions.contains("email"){
                    GraphRequest(graphPath: "/me", parameters: ["fields":"name, email,picture"]).start(completionHandler: { (connection, resultInfo, err) in
                        if err != nil {
                            print("Failure to to graph")
                            return
                        }else{
                            print("<--------------->")
                            print(resultInfo!)
                            //loginController.present(StackViewController(), animated: true, completion: nil)
                            let facebookCredential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                            Auth.auth().signInAndRetrieveData(with: facebookCredential, completion: { (authResult, error) in
                                if error == nil{
                                    print("Successful with authenticating facebook user with firebase...")
                                    
                                    // Check if the user has basic information registered, if not then it is a new user.
                                    loginController.setViewControllers([RecyclcerViewController()], animated: true)
                                }else{
                                    // User is not signed in
                                    // ...
                                    print("Failed to authenticate facebook user with firebase...")
                                }
                            })
                            
                            
                            
                        }
                    })
                }
                
            }else{
                print("Not logged in")
            }
        }
    }
    
    func getProfilePictures(image: UIImageView){
        GraphRequest(graphPath: "/me", parameters: ["fields":"picture"]).start { (connection, result, error) in
            if error == nil {
                guard let Info = result as? [String: Any] else { return }
               // print(Info)
                guard let two = Info["picture"] as? [String: Any] else { return }
                //print(two["data"])
                guard let three = two["data"] as? [String: Any] else { return }
                //print(three["url"])
                let urlString: String = three["url"] as! String
                print(urlString)
                
//                let imageUrl = URL(string: three["url"] as! String)
//                let imageData = try! Data(contentsOf: imageUrl!)
//                image.image = UIImage(data: imageData)
            }
        }
    }
    
    
    
    
    
}
