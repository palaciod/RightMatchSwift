//
//  Custom.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/20/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class Custom: UICollectionViewCell {
    
    let picture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    let question: QuestionView = {
        let question = QuestionView(frame: .zero)
        question.translatesAutoresizingMaskIntoConstraints = false
        return question
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.addSubview(picture)
        self.addSubview(picture)
        self.addSubview(question)
        setUpImageConstraints()
        setUpQuestion()
    }
    
    
    private func setUpImageConstraints(){
        picture.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        picture.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        picture.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        picture.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
        //picture.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    }
    private func setUpQuestion(){
        question.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        question.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        question.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        question.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        // question should have a method that sets up the view.. to lessen the redenring of graphics
        question.alpha = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
