//
//  RecyclerView.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/28/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class RecyclerView: UIView {
    var topUser: UserProfile?
    let recycler: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let recycler = UICollectionView(frame: .zero, collectionViewLayout: layout)
        recycler.translatesAutoresizingMaskIntoConstraints = false
        recycler.register(Custom.self, forCellWithReuseIdentifier: "cellID")
        return recycler
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(recycler)
        //setUpRecycler()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpRecycler(){
        recycler.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        recycler.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        recycler.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        recycler.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        recycler.delegate = self
        recycler.dataSource = self
        
    }
    
}
extension RecyclerView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: recycler.frame.width, height: (recycler.frame.height) * (2/3)  )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Must return the size of the user profile
        return topUser!.profileSize()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recycler.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! Custom
        cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.picture.image = nil
        cell.question.questionLabel.text = nil
        cell.question.answerALabel.answerLabel.text = nil
        cell.question.answerBLabel.answerLabel.text = nil
        cell.question.answerCLabel.answerLabel.text = nil
        cell.question.answerDLabel.answerLabel.text = nil
        
        
        
        
        let index = indexPath[1]
        
        let item = topUser!.items.getItem(at: index)
        if let url = item as? URL{
            // Our url
            cell.picture.kf.setImage(with: url)
        }else{
            // our question
            let questionObject =  item as? QuestionModel
            let questionString = questionObject!.getQuestion()
            let aString = questionObject?.getAnswerA()
            let bString = questionObject?.getAnswerB()
            let cString = questionObject?.getAnswerC()
            let dString = questionObject?.getAnswerD()
            
            cell.question.questionLabel.text = questionString
            cell.question.answerALabel.answerLabel.text = aString
            cell.question.answerBLabel.answerLabel.text = bString
            cell.question.answerCLabel.answerLabel.text = cString
            cell.question.answerDLabel.answerLabel.text = dString
            
            cell.question.alpha = 1
        }
        
        
        
        return cell
    }
    
    
    
}
