//
//  NewPatientsViewModel.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/29.
//

import Foundation

struct NewPatientsViewModel {
    var id: Double?
    var name: String?
    var email: String?
    
    var bloodtypes: [String] {
        //マップを使ってBloodType型のケースのrawValueを取得する
        return BloodType.allCases.map { $0.rawValue  }
    
    }
    var conditions: [String] {
        
        return ConditionType.allCases.map { $0.rawValue }
        
    }
    
    var weight: Double?
    var height: Double?
    
}
