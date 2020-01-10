//
//  AnswerView.swift
//  RightMatch
//
//  Created by Daniel Palacio on 10/19/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class AnswerView: UIView {
    let answerLabel: UILabel = {
        let answer = UILabel()
        answer.translatesAutoresizingMaskIntoConstraints = false
        answer.text = "answer"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        answer.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        answer.adjustsFontSizeToFitWidth = true
        answer.textAlignment = .center
        answer.layer.borderWidth = 3
        answer.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        answer.layer.cornerRadius = 30
        return answer
    }()
    let answerButton: UIButton = {
        let answer = UIButton(type: .system)
        return answer
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(answerLabel)
        setUpAnswerView()
    }
    private func setUpAnswerView(){
        answerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        answerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        answerLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        answerLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    // Require init for view
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
