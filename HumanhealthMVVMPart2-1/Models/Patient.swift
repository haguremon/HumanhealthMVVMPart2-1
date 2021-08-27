//
//  Patient.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/27.
//

import Foundation

enum BloodType: String, Codable {
    case a = "A"
    case b = "B"
    case o = "O"
    case ab = "AB"
}

enum ConditionType: String, Codable {
    case verybad = "Very bad"
    case bad = "Bad"
    case normal = "Normal"
    case alittlebetter =  "A little better"
    case verygood = "Very good"
}



struct Patient: Codable {
    
    let name: String
    let email: String
    //ケースが大まかに言うと4種類なので列挙型で
    let bloodtype: BloodType
    let condition: ConditionType
    let weight: Double
    let Height: Double
    
}
