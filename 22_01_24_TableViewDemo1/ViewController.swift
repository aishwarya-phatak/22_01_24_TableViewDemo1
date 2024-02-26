//
//  ViewController.swift
//  22_01_24_TableViewDemo1
//
//  Created by Vishal Jagtap on 26/02/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
    }
}

extension ViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.studentTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Student -- \(indexPath.section) -- \(indexPath.row)"
        if indexPath.section == 0{
            cell.backgroundColor = .lightGray
        } else {
            cell.backgroundColor = .orange
        }
        
        return cell
    }
}


