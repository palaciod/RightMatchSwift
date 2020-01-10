//
//  RegisterLocationViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/3/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseFirestore
import Geofirestore
class RegisterLocationViewController: UIViewController {
    deinit {
        print("Releasing map from memory")
    }
    var user: RightMatchUser?
    // Location stuff
    private let locationManager = CLLocationManager()
    private var previousLocation: CLLocation?
    
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
    
    private let locationLabel: UILabel = {
        let location = UILabel()
        location.translatesAutoresizingMaskIntoConstraints = false
        location.text = "Where are you from?"
        //xsschool.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        location.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        location.adjustsFontSizeToFitWidth = true
        location.textAlignment = .center
        return location
    }()
    // Create Map View
    private let map: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let cityNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0, blue: 0.3176470588, alpha: 1)
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        name.adjustsFontSizeToFitWidth = true
        name.textAlignment = .center
        name.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        name.layer.masksToBounds = true
        name.layer.cornerRadius = 12
        return name
    }()
    private let centerLocation: centerDot = {
        let center  = centerDot(frame: .zero)
        center.translatesAutoresizingMaskIntoConstraints = false
        return center
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
        view.addSubview(locationLabel)
        view.addSubview(map)
        view.addSubview(centerLocation)
        // temp label
        view.addSubview(cityNameLabel)
        view.addSubview(continueButton)
        setUpBackButton()
        setUpProgressBar()
        setUpMap()
        checkLocationServicesStatus()
        // temp constraints for label
        setUpCenterLocation()
        setUpCityNameLabel()
        setUpContinueButton()
        setUpLocationLabel()
    }
    private func setUpBackButton(){
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        backButton.heightAnchor.constraint(equalTo: progressStatus.heightAnchor).isActive = true
    }
    private func setUpProgressBar(){
        progressStatus.topAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        progressStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressStatus.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        progressStatus.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/25).isActive = true
    }
    private func checkLocationServicesStatus(){
        if CLLocationManager.locationServicesEnabled() {
            // location manager stuff
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            checkLocationAuth()
            map.delegate = self
        }else{
            // Services are turned off
            print("this is failing")
        }
    }
    private func zoomUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            map.setRegion(region, animated: true)
        }
    }
    private func checkLocationAuth(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            print("always")
            break
        case .authorizedWhenInUse:
            print("when in use")
            map.showsUserLocation = true
            zoomUserLocation()
            previousLocation = getCurrentCordinate(for: map)
            break
        case .denied:
            break
        case .notDetermined:
            print("not determined")
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
         default:
            break
        }
    }
    private func setUpLocationLabel(){
        locationLabel.topAnchor.constraint(equalTo: progressStatus.bottomAnchor, constant: 10).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
        locationLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/16).isActive = true
    }
    private func setUpMap(){
        map.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        map.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        map.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1.3).isActive = true
    }
    private func setUpCenterLocation(){
        centerLocation.centerXAnchor.constraint(equalTo: map.centerXAnchor).isActive = true
        centerLocation.centerYAnchor.constraint(equalTo: map.centerYAnchor).isActive = true
        centerLocation.widthAnchor.constraint(equalTo: map.widthAnchor, multiplier: 1/11).isActive = true
        centerLocation.heightAnchor.constraint(equalTo: centerLocation.widthAnchor).isActive = true
    }
    override func viewDidLayoutSubviews() {
        centerLocation.layer.cornerRadius = centerLocation.bounds.size.height/2
        continueButton.layer.cornerRadius = continueButton.bounds.size.height/2
    }
    private func setUpCityNameLabel(){
        cityNameLabel.topAnchor.constraint(equalTo: map.topAnchor, constant: 15).isActive = true
        cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameLabel.widthAnchor.constraint(equalTo: map.widthAnchor, multiplier: 1/2).isActive = true
        cityNameLabel.heightAnchor.constraint(equalTo: map.heightAnchor, multiplier: 1/11).isActive = true
    }
    
    private func getCurrentCordinate(for mapView: MKMapView) -> CLLocation{
        let lat = mapView.centerCoordinate.latitude
        let long = mapView.centerCoordinate.longitude
        return CLLocation(latitude: lat, longitude: long)
    }
    
    private func setUpContinueButton(){
        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
        continueButton.widthAnchor.constraint(equalTo: continueButton.heightAnchor).isActive = true
        continueButton.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
    }
    
    @objc private func toNextPage(){
        // Time to store basic user information to firestore...
        print("<--------Fire Store-------->")
       
        
        let docData: [String: Any] = [
            "name" : user!.getName(),
            "gender" : user!.getMyGender(),
            "theirGender" : user!.getTheirGender(),
            "year" : user!.getYear(),
            "month" : user!.getMonth(),
            "day" : user!.getDay(),
            "age" : user!.getAge(),
            "school" : user?.getSchool() ?? "",
            "educationLevel" : user?.getEducationLevel() ?? "",
            "height" : user?.getHeight() ?? ""
        ]
        FirebaseModel.database.collection("users").document(FirebaseModel.userID!).collection("accountDetails").document("generalUserInformation").setData(docData) { error in
        if let error = error {
            print(error.localizedDescription)
            print("Failed to write to Fire Store")
        }else {
            print("Success writing to Fire Store")
        }

        }
        
        
        // Geo Firestore set location
        let fireRef = Firestore.firestore().collection("users")
        let geoRef = GeoFirestore(collectionRef: fireRef)
        geoRef.setLocation(location: map.userLocation.location!, forDocumentWithID: FirebaseModel.userID!) { (error) in
            if let error = error {
                print("An error occured: \(error)")
            } else {
                print("Saved location successfully!")
            }
        }
        print("<-------Map memory release---------->")
        self.map.showsUserLocation = false
        self.map.removeFromSuperview()
        locationManager.delegate = nil
        map.delegate = nil
        let rules = RuleViewController()
        navigationController?.setViewControllers([rules], animated: true)
    }
    
    

}
extension RegisterLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("success")
        checkLocationAuth()
    }
    
}
extension RegisterLocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("Is happening")
        let center = getCurrentCordinate(for: map)
        let geoCoder = CLGeocoder()
        guard let previousLocation = self.previousLocation else { print("Failed0"); return}
        guard center.distance(from: previousLocation) > 10 else {
            print("Failed3")
            return
        }
        self.previousLocation = center
        // You need the week self to prevent a leak in memory
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemark, error) in
            guard self != nil else {
                print("Failed1");
                return
            }
            if let _ = error {
                // Show alert for the user
            }
            guard let placemark = placemark?.first else{
                print("Failed2");
                return
            }
            guard let city = placemark.subLocality else{
                guard placemark.locality != nil else{
                    guard placemark.administrativeArea != nil else {
                        return
                    }
                    return
                }
                return
            }
            DispatchQueue.main.async {
                print("This is my city: " + city)
                self?.cityNameLabel.text = city
            }
        }
    }
}
