//
//  PatientsVIewModel.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/26.
//PatientLstTableViewControllerに表示するデータなどを請け負う//Patient単体のデータとリストを取る

import Foundation

//下で作ったデータを用いる
//ここはクラスでも構造体でもどっちでもいいのかな？　structの方が安全な気がするけど
struct PatientListViewModle {
    
    var patients: [PatientViewModle]
    
    init() {
        
        self.patients = [PatientViewModle]()
        
    }
}
extension PatientListViewModle {
    
    
    
    func forRowAtindex( at index: Int) ->  PatientViewModle {
        
        return patients[index]
        
        
    }
    
    
}








//一つの患者リスト
struct PatientViewModle {
    
    let patient: Patient
    
}
extension PatientViewModle {
    
    var id : Double {
        
        return patient.id
    }
    
    var name: String {
        
        return patient.name
        
    }
    
    var email: String {
        
        return patient.email
    }
    
    var bloodtype: String {
        
        return patient.bloodtype.rawValue.capitalized
    }
    
    var condition: String {
        
        return patient.condition.rawValue.capitalized
    }
    
    var weight: Double {
        
        return patient.weight
    }
    
    var height:  Double {
        
        return patient.height
    }
    
    
    
}
//"id": 1,
//"name": "iwasaki",
//"email": "iwasaki",
//"bloodtype": "O",
//"condition": "Normal",
//" ": 35,
//"Height": 177


