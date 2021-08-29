//
//  NewPatientsViewModel.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/29.
//

import Foundation
import UIKit

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
    
    var bloodtypeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: BloodType.allCases.map { $0.rawValue  })        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    func setupUI(vc: NewPatientsViewController) {
        
        vc.view.addSubview(bloodtypeSegmentedControl)
        // ｙ軸
        bloodtypeSegmentedControl.topAnchor.constraint(equalTo: vc.tableView.bottomAnchor,constant: 40).isActive = true
       //　x軸
        bloodtypeSegmentedControl.leftAnchor.constraint(equalTo: vc.label.rightAnchor, constant: 40).isActive = true
        
    }
    
}
