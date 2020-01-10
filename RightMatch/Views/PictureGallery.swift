//
//  PictureGallery.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/16/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class PictureGallery: UIView {
   
    let firstPhoto: ImageButton = {
        let button = ImageButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let secondButton: ImageButton = {
        let button = ImageButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let thirdButton: ImageButton = {
        let button = ImageButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let fourthButton: ImageButton = {
        let button = ImageButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let fifthButton: ImageButton = {
        let button = ImageButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let sixthButton: ImageButton = {
        let button = ImageButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let galleryStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(galleryStack)
        setUpGalleryStack()
        addToGalleryStack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createPhotoRowStack(firstImage: ImageButton, secondImage: ImageButton) -> UIStackView{
        let rowStack = UIStackView()
        rowStack.translatesAutoresizingMaskIntoConstraints = false
        rowStack.distribution = .fillEqually
        rowStack.spacing = 10
        rowStack.axis = .horizontal
        rowStack.addArrangedSubview(firstImage)
        rowStack.addArrangedSubview(secondImage)
        return rowStack
    }
    private func addToGalleryStack(){
        galleryStack.addArrangedSubview(createPhotoRowStack(firstImage: firstPhoto, secondImage: secondButton))
        galleryStack.addArrangedSubview(createPhotoRowStack(firstImage: thirdButton, secondImage: fourthButton))
        galleryStack.addArrangedSubview(createPhotoRowStack(firstImage: fifthButton, secondImage: sixthButton))
    }
    
    private func setUpGalleryStack(){
        galleryStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        galleryStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        galleryStack.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        galleryStack.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
}


