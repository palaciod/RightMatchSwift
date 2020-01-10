//
//  centerDot.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/4/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class centerDot: UIView {
    // This view will consist of a circular view with a color depending on current users gender
    private let dot: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        dot.layer.cornerRadius = 12
        return dot
    }()
    private let outerDot: UIView = {
        let outer = UIView()
        outer.translatesAutoresizingMaskIntoConstraints = false
        outer.backgroundColor = UIColor(white: 1, alpha: 0.7)
        outer.layer.cornerRadius = 15
        outer.layer.masksToBounds = true
        return outer
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        outerDot.addSubview(dot)
        self.addSubview(outerDot)
        setUpInnerDot()
        setUpOuterDot()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        dot.layer.cornerRadius = dot.bounds.size.height/2
        //outerDot.layer.cornerRadius = outerDot.bounds.size.height/2
    }
    
    private func setUpInnerDot(){
        dot.centerXAnchor.constraint(equalTo: outerDot.centerXAnchor).isActive = true
        dot.centerYAnchor.constraint(equalTo: outerDot.centerYAnchor).isActive = true
        dot.widthAnchor.constraint(equalTo: outerDot.widthAnchor, multiplier: 1/1.5).isActive = true
        dot.heightAnchor.constraint(equalTo: outerDot.heightAnchor, multiplier: 1/1.5).isActive = true
    }
    private func setUpOuterDot(){
        outerDot.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        outerDot.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        outerDot.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        outerDot.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
}
