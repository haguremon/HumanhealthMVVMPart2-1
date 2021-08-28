//
//  Patient.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/27.
//

import Foundation

enum BloodType: String, Codable {
    case a
    case b
    case o
    case ab
}

enum ConditionType: String, Codable {
    case verybad
    case bad
    case normal
    case alittlebetter
    case verygood
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

struct User: Codable {
    
    let login: String
    
    let id: Int
    
    let avatarurl: String
    
    let createdat: String
    
    let bio: String
    
    enum CodingKeys
    : String, CodingKey {
        case login
        case id
        case avatarurl = "avatar_url"
        case createdat = "created_at"
        case bio
    }
}
//https://api.github.com/users/haguremon
//extension User {
//    //エンコードするための処理
//    //Resource<[Order]>型で返すstaticプロパティを作成
//    static var all: Resource<[User]> = {
//
//        guard let url = URL(string: "https://api.github.com/users/haguremon") else {
//            fatalError("URL is incorrect ")
//        }
//
//        return Resource<[User]>(url: url)
//
//    }()
//}
