//
//  NewPatientsViewController.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/26.
//

import UIKit

class NewPatientsViewController: UIViewController {
    
    
    
    @IBOutlet  weak var tableView: UITableView!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var weightTF: UITextField!
    
    @IBOutlet weak var heightTF: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    private var registerid: Double = 0
    
    private var npvm = NewPatientsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        npvm.setupUI(vc: self)
        registerid = UserDefaults.standard.double(forKey: "id")
    }
    
    
    @IBAction private func registerButton() {
        let vc = storyboard?.instantiateViewController(identifier: "vc") as! PatientListTableViewController
        
        guard let name = nameTF.text, !name.isEmpty ,
              let email = emailTF.text, !email.isEmpty ,
              let weight = Double(weightTF.text ?? ""), weight > 0 ,
              let height = Double(heightTF.text ?? ""), height > 0 ,
              let indexPath = tableView.indexPathForSelectedRow ,
              let selectedSize = npvm.bloodTypeSegmentedControl.titleForSegment(at: npvm.bloodTypeSegmentedControl.selectedSegmentIndex) else {
            print("test")
            return
        }
       
        registerid += 1
        npvm.id = registerid
        npvm.name = name
        npvm.email = email
        npvm.weight = weight
        npvm.height = height
        npvm.selectedBloodType = selectedSize
        npvm.selectedCondition = npvm.conditions[indexPath.row]
        
        UserDefaults.standard.set(registerid, forKey: "id")
             
        LocalHost().load(resource: Patient.create(self.npvm)) { [ weak self ] result in
            switch result {
            
            case .success(let patient):
            
            print(patient)
                vc.patientListViewModle.patients.append(PatientViewModle(patient: patient!))
                DispatchQueue.main.async {
                    vc.tableView.insertRows(at: [IndexPath.init(row: vc.patientListViewModle.patients.count - 1, section: 0)], with: .automatic)
                    vc.tableView.reloadData()
                }
                self?.present(vc, animated: true, completion: nil)
            
            case .failure(let error):
               print("aaaaaaaaaaaaa")
                print(error)
            
            }
        }
    
    
    }
    
}

extension NewPatientsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        npvm.conditions.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = npvm.conditions[indexPath.row]
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    
    }
    
    
}
