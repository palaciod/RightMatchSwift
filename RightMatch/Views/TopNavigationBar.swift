//
//  TopNavigationBar.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/21/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class TopNavigationBar: UIView {
    let homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Home", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let messagesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Messages", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        // Background color is only temprorary 
        self.addSubview(homeButton)
        self.addSubview(messagesButton)
        setUpHomeButton()
        setUpMessageButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpHomeButton(){
        homeButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        homeButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        homeButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    private func setUpMessageButton(){
        messagesButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messagesButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        messagesButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        messagesButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    

}
