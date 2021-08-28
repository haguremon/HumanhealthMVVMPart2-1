//
//  NewPatientsViewController.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/26.
//

import UIKit

class NewPatientsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let url = URL(string: "https://api.github.com/users/haguremon")!
        
        let resource =  Resource<[User]>(url: url)
        
      LocalHost().load(resource: resource) { result in
        
        print(result)

            switch result {

            case .success(let patient):

                print(patient)

            case  .failure(let error):
                print(error)


            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
