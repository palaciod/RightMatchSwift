//
//  CustomFacebook.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/21/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit
/**
 We will create a UIView that will contain the facebook button and that of the logo ontop
 The logo will be ontop of the button
 */
class CustomFacebook: UIView {
    
    // We create a Firebase model here to create the facebook credentials
    let fireBase: FirebaseModel = {
        let fireBase = FirebaseModel()
        return fireBase
    }()
    
    // The facebook model that will operate the login and register for us 
    let facebookMethods: FacebookModel = {
        let facebook = FacebookModel()
        return facebook
    }()
    
    let fbLogoImage: UIImageView = {
        let fbLogo = UIImageView(image: #imageLiteral(resourceName: "Image"))
        fbLogo.translatesAutoresizingMaskIntoConstraints = false
        //fbLogo.contentMode = .scaleAspectFill
        return fbLogo
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.3333333333, blue: 0.6431372549, alpha: 1)
        button.setTitle("Continue with Facebook", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
        self.addSubview(fbLogoImage)
        setUpButton()
        setUpFacebookLogo()
    }
    
    func setCornerRadius(cornerRadius: CGFloat){
        button.layer.cornerRadius = cornerRadius
    }
    
    private func setUpButton(){
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    private func setUpFacebookLogo(){
        fbLogoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        fbLogoImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        fbLogoImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/1.5).isActive = true
        fbLogoImage.widthAnchor.constraint(equalTo: fbLogoImage.heightAnchor).isActive = true
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
