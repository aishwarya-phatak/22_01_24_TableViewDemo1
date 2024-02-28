//
//  StudentDetailsViewController.swift
//  22_01_24_TableViewDemo1
//
//  Created by Vishal Jagtap on 28/02/24.
//

import UIKit

class StudentDetailsViewController: UIViewController {
    
    @IBOutlet weak var studentNameLabel: UILabel!
    var nameContainer : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        
    }
    
    func bindData(){
        self.studentNameLabel.text = nameContainer
    }
    

}
