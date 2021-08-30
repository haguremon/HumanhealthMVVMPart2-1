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
////エンコードとpostするための処理を下でやる
extension Patient {
    
    //Resource<[Order]>型で返すstaticプロパティを作成
    static var all: Resource<[Patient]> = {
        
        guard let url = URL(string: "http://localhost:3000/patients") else {
            fatalError("URL is incorrect ")
        }
        
        return Resource<[Patient]>(url: url)
        
    }()
    
    static func create(_ vm: NewPatientsViewModel) -> Resource<Patient?> {
        
        let patient = Patient(vm)
        
        guard let url = URL(string: "http://localhost:3000/patients") else {
            fatalError("url mis")
            
        }
        guard let body = try? JSONEncoder().encode(patient) else {
          
            fatalError("The format could not be changed ")
        }
        
        var resource = Resource<Patient?>(url: url)
        print(body)
        resource.httpMethod = HttpMethod.post
        resource.body = body
    
        return resource
    }

}



//1　エンコードするデータの入ったPatientを作る

extension Patient {
    
    
    
    init?(_ vm: NewPatientsViewModel) {
        guard let id = vm.id,
              let name = vm.name,
              let email = vm.email,
              let bloodtypes = BloodType(rawValue: vm.selectedBloodType!),
             
              let conditions = ConditionType(rawValue: vm.selectedCondition!),
              let  weight = vm.weight,
              let  height = vm.height  else {
            
         return nil
        
        }
        self.id = id
        self.name = name
        self.email = email
        self.bloodtype = bloodtypes
        self.condition = conditions
        self.weight = weight
        self.height = height
    }
}

