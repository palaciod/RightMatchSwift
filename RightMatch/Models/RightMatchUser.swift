//
//  RightMatchUser.swift
//  RightMatch
//
//  Created by Daniel Palacio on 8/27/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation

class RightMatchUser {
    private var name = ""
    private var year = ""
    private var month = ""
    private var day = ""
    private var age = 0 // 18 is the age restriction
    private var myGender = ""
    private var school = ""
    private var educationLevel = ""
    private var theirGender = ""
    private var feetHeight = "3'"
    private var inchHeight = "0"
    private var currentLat: Double = 0.0
    private var currentLong: Double = 0.0
    
    init(_name: String, _year: String, _month: String, _day: String, _age: Int, _myGender: String, _theirGender: String, _school: String, _educationLevel: String, lat: Double, long: Double) {
        name = _name
        year = _year
        month = _month
        day = _day
        age = _age
        myGender = _myGender
        theirGender = _theirGender
        school = _school
        educationLevel = _educationLevel
        currentLat = lat
        currentLong = long
    }
    // Just to test some functionallity in firebase
    public func getName() -> String{
        return name
    }
    public func setName(newName: String){
        name = newName
    }
    public func getMyGender() -> String{
        return myGender
    }
    public func setMyGender(newGender: String){
        myGender = newGender
    }
    public func getTheirGender() -> String{
        return theirGender
    }
    public func setTheirGender(newGender: String){
        theirGender = newGender
    }
    public func getYear() -> String {
        return year
    }
    public func setYear(newYear: String){
        year = newYear
    }
    public func getMonth() -> String {
        return month
    }
    public func setMonth(newMonth: String) {
        month = newMonth
    }
    public func getDay() -> String{
        return day
    }
    public func setDay(newDay: String){
        day = newDay
    }
    public func getAge() -> Int {
        return age
    }
    public func setAge(newAge: Int){
        age = newAge
    }
    public func createAge() -> Int{
        let currentYear = Calendar.current.component(.year, from: Date())
        let currentMonth = Calendar.current.component(.month, from: Date())
        let currentDay = Calendar.current.component(.day, from: Date())
        age = currentYear - Int(year)!
        let monthDifference = currentMonth - Int(month)!
        if monthDifference < 0 {
            age -= 1
        }else if monthDifference == 0 {
            let dayDifference = currentDay - Int(day)!
            if dayDifference > 0 {
                age -= 1
            }
        }
        return age
    }
    public func getSchool() -> String {
        return school
    }
    
    public func setSchool(newSchool: String){
        school = newSchool
    }
    public func getEducationLevel() -> String{
        return educationLevel
    }
    public func setEducationLevel(setLevel: String){
        educationLevel = setLevel
    }
    public func getInchHeight() -> String {
        return inchHeight
    }
    public func setInchHeight(newHeight: String){
        inchHeight = newHeight
    }
    public func getFeetHeight() -> String {
        return feetHeight
    }
    public func setFeetHeight(newHeight: String){
        feetHeight = newHeight
    }
    public func getHeight() -> String {
        return feetHeight + inchHeight
    }
    public func getLat() -> Double {
        return currentLat
    }
    public func setLat(newLat: Double){
        currentLat = newLat
    }
    public func getLong() -> Double {
        return currentLong
    }
    public func setLong(newLong: Double){
        currentLong = newLong
    }
   
    
   
    
}
