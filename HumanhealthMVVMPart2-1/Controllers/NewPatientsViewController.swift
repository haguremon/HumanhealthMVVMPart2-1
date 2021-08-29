//
//  NewPatientsViewController.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/26.
//

import UIKit

class NewPatientsViewController: UIViewController {
    
    
    
    @IBOutlet  weak var tableView: UITableView!
    
    @IBOutlet private var nameTF: UITextField!
    
    @IBOutlet private var emailTF: UITextField!
    
    @IBOutlet private var weightTF: UITextField!
    
    @IBOutlet private var heightTF: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    private var registerid: Double = 0
    
    private var npvm = NewPatientsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        npvm.setupUI(vc: self)
    
    }
    
    
    @IBAction private func register() {
        
        registerid += 1
        
        
        
        
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
    
    
    
}
