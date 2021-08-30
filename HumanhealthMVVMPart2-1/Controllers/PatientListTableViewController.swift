//
//  PatientLstTableViewController.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/26.
//http://localhost:3000/patients

import UIKit

class PatientListTableViewController: UITableViewController {
    
    var patientListViewModle = PatientListViewModle()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInformation()
        
    }
    
    
    func getInformation(){

        LocalHost().load(resource: Patient.all) { result in
            
            print(result)
            
            switch result {
            case .success(let patient):
                
                self.patientListViewModle.patients = patient.map(PatientViewModle.init)
                
                self.tableView.reloadData()
                
            case  .failure(let error):
                print(error)
                
                
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return patientListViewModle.patients.count
   
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let vm = patientListViewModle.forRowAtindex(at: indexPath.row)
        
        cell.textLabel?.text = vm.name
        cell.detailTextLabel?.text = vm.condition
        
        return cell
    }

    
}
