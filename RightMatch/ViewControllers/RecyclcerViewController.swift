//
//  RecyclcerViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/20/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit
import Firebase
import Geofirestore
// temp import
import Kingfisher
class RecyclcerViewController: UIViewController {
    // An instance of the stack
    var stack: StackModel?
    // Below is an instance of a userprofile by the authenticated user
    var profile: UserProfile?
    // we will keep in instance of the users information at all times
    var rightMatchUser: RightMatchUser? = nil
    var macName: String?
    var userCoordinate: GeoPoint? = nil
    let facebookMethods: FacebookModel = {
        let facebook = FacebookModel()
        return facebook
    }()
    
    let fireBase: FirebaseModel = {
        let fireBase = FirebaseModel()
        return fireBase
    }()
    let navigationBar: TopNavigationBar = {
        let bar = TopNavigationBar(frame: .zero)
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    private let recycler: RecyclerView = {
        let recycler = RecyclerView(frame: .zero)
        recycler.translatesAutoresizingMaskIntoConstraints = false
        return recycler
    }()
    private let visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    private let secondRecycler: RecyclerView = {
        let recycler = RecyclerView(frame: .zero)
        recycler.translatesAutoresizingMaskIntoConstraints = false
        return recycler
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stack = fireBase.getPotentialMatches()
        fireBase.getRightMatchUser(recycler: self)
        // Do any additional setup after loading the view.
        view.addSubview(navigationBar)
        setUpNavBar()
        view.addSubview(secondRecycler)
        view.addSubview(recycler)
        view.addSubview(visualEffect)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // <-------Set up the collection view after we have the size of the profile confirmed-------->
            self.recycler.setUpRecycler()
            
            self.secondRecycler.setUpRecycler()
            
            // first recycler should have the popped version
            self.recycler.topUser = self.stack?.pop()
            // Second recycler should have the top version of the stack after its popped
            self.secondRecycler.topUser = self.stack?.top()
            self.setUpSecondRecycler()
            self.setUpRecycler()
            self.recycler.topUser?.setUpItemQueue()
            self.secondRecycler.topUser?.setUpItemQueue()
            
            
            
        }
        
    }
    
    private func setUpNavBar(){
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/13).isActive = true
        navigationBar.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        // temp targets
        navigationBar.homeButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        navigationBar.messagesButton.addTarget(self, action: #selector(animateMoveLeft), for: .touchUpInside)
    }
    
    
    // <----------------------------------------------------------->
    
    // <----------------------------------------------------------->
   
    
    @objc private func logout(){
        let currentUser = Auth.auth().currentUser
        facebookMethods.logout()
        if currentUser != nil {
            do{
                try Auth.auth().signOut()

                print("Successfully logged out")
                let loginController = LogInViewController()
                navigationController?.setViewControllers([loginController], animated: true)
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        }else{
            print("User is nil")
        }
      
    }
    
    private func setUpRecycler(){
        recycler.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        recycler.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recycler.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        recycler.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.01).isActive = true
        recycler.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 11.5/13).isActive = true
        recycler.isUserInteractionEnabled = true
        
    }
    private func setUpSecondRecycler(){
        secondRecycler.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        secondRecycler.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondRecycler.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        secondRecycler.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.01).isActive = true
        secondRecycler.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 11.5/13).isActive = true
        secondRecycler.isUserInteractionEnabled = true
    }
    private func setUpBlurEffect(){
        recycler.addSubview(visualEffect)
        visualEffect.centerXAnchor.constraint(equalTo: recycler.centerXAnchor).isActive = true
        visualEffect.centerYAnchor.constraint(equalTo: recycler.centerYAnchor).isActive = true
        visualEffect.widthAnchor.constraint(equalTo: recycler.widthAnchor).isActive = true
        visualEffect.heightAnchor.constraint(equalTo: recycler.heightAnchor).isActive = true
        
    }
    @objc private func animateMoveLeft(){
        print("animate")
        UIView.animate(withDuration: 0.55, animations: {
            self.recycler.transform = CGAffineTransform(translationX: -300, y: -500)
            self.recycler.alpha = 0
        }) { (_) in
            //self.recycler.alpha = 1
            //self.recycler.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }
        
        
    }
    
    @objc private func printURLS(){
        
    }
    
    

}



