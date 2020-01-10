//
//  StackViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/13/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit
import Firebase
class StackViewController: UIViewController {
    deinit {
        print("Releasing StackVC from memory")
    }
    let facebookMethods: FacebookModel = {
        let facebook = FacebookModel()
        return facebook
    }()
    // Temporary back button for StackViewController
    let goBackButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let button: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.setTitle("poof", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // Back button on the top left part of the table view controller
        //view.addSubview(goBackButton)
        view.addSubview(goBackButton)
        view.addSubview(button)
        
        setUpBackButton()
        setUpRecyclerViewButton()
    }
    
    private func setUpBackButton(){
        goBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        goBackButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        goBackButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        goBackButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/13).isActive = true
        goBackButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    private func setUpRecyclerViewButton(){
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/13).isActive = true
        button.addTarget(self, action: #selector(toRecycler), for: .touchUpInside)
    }
    @objc func toRecycler(){
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(RegisterNameViewController(), animated: true)
        print(navigationController?.viewControllers ?? "")
    }
    
    
    @objc func back(){
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
