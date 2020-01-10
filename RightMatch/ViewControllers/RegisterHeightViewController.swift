//
//  RegisterHeightViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/26/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class RegisterHeightViewController: UIViewController {
    deinit {
        print("Released Height from memory")
    }
    var user: RightMatchUser?
    private let backButton: UIButton = {
        let back = UIButton(type: .system)
        back.translatesAutoresizingMaskIntoConstraints = false
        //back.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        back.setTitle("◀︎", for: .normal)
        back.setTitleColor(#colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1), for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        return back
    }()
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
    private let heightLabel: UILabel = {
        let height = UILabel()
        height.translatesAutoresizingMaskIntoConstraints = false
        height.text = "What's your height?"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        height.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        height.adjustsFontSizeToFitWidth = true
        height.textAlignment = .center
        return height
    }()
    private let heightPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        picker.layer.cornerRadius = 12
        
        
        return picker
    }()
    private var feetHeight: Array<String> = {
        let height = [String]()
        return height
    }()
    private var inchesHeight: Array<String> = {
        let height = [String]()
        return height
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
        view.addSubview(backButton)
        view.addSubview(progressStatus)
        view.addSubview(heightLabel)
        view.addSubview(heightPickerView)
        view.addSubview(continueButton)
        createHeights()
        heightPickerView.delegate = self
        heightPickerView.dataSource = self
        setUpBackButton()
        setUpProgressBar()
        setUpPicker()
        setUpHeightLabel()
        setUpContinueButton()
        // Do any additional setup after loading the view.
    }
    private func setUpBackButton(){
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        backButton.heightAnchor.constraint(equalTo: progressStatus.heightAnchor).isActive = true
    }
    private func setUpProgressBar(){
        progressStatus.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        progressStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressStatus.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        progressStatus.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/25).isActive = true
    }
    private func setUpHeightLabel(){
        heightLabel.bottomAnchor.constraint(equalTo: heightPickerView.topAnchor, constant: -20).isActive = true
        heightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heightLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
    }
    private func setUpPicker(){
        heightPickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        heightPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heightPickerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.5).isActive = true
        heightPickerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
    }
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        continueButton.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
    }
    @objc private func toNextPage(){
        heightPickerView.delegate = nil
        let locationViewController = RegisterLocationViewController()
        locationViewController.user = user
        navigationController?.pushViewController(locationViewController, animated: true)
    }
    private func createHeights(){
        var feet = 3
        var inches = 0
        while feet<8{
            feetHeight.append(String(feet) + "'")
            feet += 1
        }
        while inches<12{
            inchesHeight.append(String(inches))
            inches += 1
        }
    }
    override func viewDidLayoutSubviews() {
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
    }

}

extension RegisterHeightViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return feetHeight.count
        }
        return inchesHeight.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return feetHeight[row]
        }
        return inchesHeight[row]
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.width/8
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil{
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
            pickerLabel?.adjustsFontSizeToFitWidth = true
            pickerLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            pickerLabel?.textAlignment = .center
        }
        if component == 0 {
            pickerLabel?.text = feetHeight[row]
        }else{
            pickerLabel?.text = inchesHeight[row]
        }
        
        return pickerLabel!
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("pass0")
        if component == 0 {
            print("pass1")
            user?.setFeetHeight(newHeight: feetHeight[row])
        }else{
            print("pass2")
            user?.setInchHeight(newHeight: inchesHeight[row])
        }
    }
    
}
