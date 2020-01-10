//
//  PictureGalleryViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/15/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class PictureGalleryViewController: UIViewController {
    deinit {
        print("Releasing PictureGalleryViewController from memory")
    }
    let fireBase: FirebaseModel = {
        let fireBase = FirebaseModel()
        return fireBase
    }()
    var indexButton: String = "firstPicture"
    var imageCount: Int = 0

    private let progressStatus: UIPageControl = {
        let page = UIPageControl(frame: .zero)
        page.translatesAutoresizingMaskIntoConstraints = false
        page.numberOfPages = 5
        page.currentPage = 0
        page.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        page.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        page.isEnabled = false
        return page
    }()
    private let pictureLabel: UILabel = {
        let school = UILabel()
        school.translatesAutoresizingMaskIntoConstraints = false
        school.text = "Where did you go for school?"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        school.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        school.adjustsFontSizeToFitWidth = true
        school.textAlignment = .center
        return school
    }()
    var imageButton: ImageButton?
    private let pictureGallery: PictureGallery = {
        let pictures = PictureGallery(frame: .zero)
        pictures.translatesAutoresizingMaskIntoConstraints = false
        return pictures
    }()
    private let continueButton: UIButton = {
        let cont = UIButton(type: .system)
        cont.translatesAutoresizingMaskIntoConstraints = false
        cont.setTitle("➤", for: .normal)
        cont.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        cont.layer.cornerRadius = 29
        cont.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        cont.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        cont.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        
        cont.titleLabel?.adjustsFontSizeToFitWidth = true
        cont.titleLabel?.minimumScaleFactor = 0.5
        //cont.titleLabel?.adjustsFontForContentSizeCategory = true
        
        return cont
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(progressStatus)
        view.addSubview(pictureLabel)
        view.addSubview(pictureGallery)
        view.addSubview(continueButton)
        setUpProgressBar()
        setUpPictureGallery()
        setUpContinueButton()
        setUpPictureLabel()
        //setUpGallery()
    }
    private func setUpProgressBar(){
        progressStatus.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        progressStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressStatus.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        progressStatus.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/25).isActive = true
    }
    private func setUpPictureLabel(){
        pictureLabel.topAnchor.constraint(equalTo: progressStatus.bottomAnchor).isActive = true
        pictureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pictureLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        pictureLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10).isActive = true
    }
    private func setUpPictureGallery(){
        pictureGallery.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pictureGallery.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pictureGallery.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.4).isActive = true
        pictureGallery.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1.7).isActive = true
        // Adding targets
        pictureGallery.firstPhoto.imageButton.addTarget(self, action: #selector(firstImageButton), for: .touchUpInside)
        pictureGallery.secondButton.imageButton.addTarget(self, action: #selector(secondImageButton), for: .touchUpInside)
        pictureGallery.thirdButton.imageButton.addTarget(self, action: #selector(thirdImageButton), for: .touchUpInside)
        pictureGallery.fourthButton.imageButton.addTarget(self, action: #selector(fourthImageButton), for: .touchUpInside)
        pictureGallery.fifthButton.imageButton.addTarget(self, action: #selector(fifthImageButton), for: .touchUpInside)
        pictureGallery.sixthButton.imageButton.addTarget(self, action: #selector(sixthImageButton), for: .touchUpInside)
    }
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        // Adding the target to the continue button
        continueButton.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
        pictureGallery.layer.cornerRadius = pictureGallery.bounds.size.height/2
    }
   
    @objc private func firstImageButton(){
        print("I was clicked")
        indexButton = "firstPicture"
        buttonClicked(imageButton: pictureGallery.firstPhoto)
        showImageController()
        imageCount += 1
    }
    @objc private func secondImageButton(){
        indexButton = "secondPicture"
        buttonClicked(imageButton: pictureGallery.secondButton)
        showImageController()
        imageCount += 1
    }
    @objc private func thirdImageButton(){
        indexButton = "thirdPicture"
        buttonClicked(imageButton: pictureGallery.thirdButton)
        showImageController()
        imageCount += 1
    }
    @objc private func fourthImageButton(){
        indexButton = "fourthPicture"
        buttonClicked(imageButton: pictureGallery.fourthButton)
        showImageController()
        imageCount += 1
    }
    @objc private func fifthImageButton(){
        indexButton = "fifthPicture"
        buttonClicked(imageButton: pictureGallery.fifthButton)
        showImageController()
        imageCount += 1
    }
    @objc private func sixthImageButton(){
        indexButton = "sixthPicture"
        buttonClicked(imageButton: pictureGallery.sixthButton)
        showImageController()
        imageCount += 1
    }
    @objc private func toNextPage(){
        if imageCount != 0 {
            navigationController?.setViewControllers([EnableNotificationsViewController()], animated: true)
        }else{
            print("Must fill in at least one answer")
            let alert = UIAlertController(title: "Please select at least one photo for your profile", message: "You need at least one photo to show on your profile.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
                print("ok")
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
extension PictureGalleryViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImageController(){
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func buttonClicked(imageButton: ImageButton){
        self.imageButton = imageButton
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageButton?.setImage(image: editedImage)
            fireBase.upLoadImageToStorage(image: editedImage, indexOfImage: indexButton)
            imageButton?.imageButton.imageView?.layer.cornerRadius = 12
            imageButton?.imageButton.imageView?.contentMode = .scaleAspectFit
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageButton?.setImage(image: originalImage)
            fireBase.upLoadImageToStorage(image: originalImage, indexOfImage: indexButton)
            imageButton?.imageButton.imageView?.layer.cornerRadius = 12
            imageButton?.imageButton.imageView?.contentMode = .scaleAspectFit
        }else{
            print("failedß")
        }
        
        dismiss(animated: true, completion: nil)
        picker.delegate = nil
    }
}
