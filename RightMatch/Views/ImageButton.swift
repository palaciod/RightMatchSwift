//
//  ImageButton.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/17/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class ImageButton: UIView {
    let imageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    private let plusSign: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "✚"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(plusSign)
        self.addSubview(imageButton)
        setUpButton()
        setUpLabel()
        
        
    }
    private func setUpButton(){
        imageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    private func setUpLabel(){
        plusSign.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        plusSign.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        plusSign.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        plusSign.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        //self.sendSubviewToBack(plusSign)
    }
    func addTargets(subAction: Selector){
        imageButton.addTarget(self, action: subAction, for: .touchUpOutside)
    }
    func setImage(image: UIImage){
        imageButton.setImage(image, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
