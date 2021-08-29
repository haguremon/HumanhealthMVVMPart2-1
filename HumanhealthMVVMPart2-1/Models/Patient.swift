//
//  Patient.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/27.
//

import Foundation

enum BloodType: String, Codable, CaseIterable {
    case a = "A"
    case b = "B"
    case o = "O"
    case ab = "AB"
}

enum ConditionType: String, Codable, CaseIterable {
    case verybad = "Very bad"
    case bad = "Bad"
    case normal = "Normal"
    case alittlebetter = "A Little Better"
    case verygood = "Very Good "
}



struct Patient: Codable {
    
    let id: Double
    let name: String
    let email: String
    //ケースが大まかに言うと4種類なので列挙型で
    let bloodtype: BloodType
    let condition: ConditionType
    let weight: Double
    let height: Double
    
}
//extension Patient {
//    //エンコードするための処理
//    //Resource<[Order]>型で返すstaticプロパティを作成
//    static var all: Resource<[Patient]> = {
//        
//        guard let url = URL(string: "http://localhost:3000/patients") else {
//            fatalError("URL is incorrect ")
//        }
//        
//        return Resource<[Patient]>(url: url)
//        
//    }()
//}
