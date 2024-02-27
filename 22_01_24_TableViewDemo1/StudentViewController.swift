//
//  StudentViewController.swift
//  22_01_24_TableViewDemo1
//
//  Created by Vishal Jagtap on 27/02/24.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        registerXIBWithTableView()
    }
    
    func initializeTableView(){
        studentTableView.delegate = self
        studentTableView.dataSource = self
    }
    
    func registerXIBWithTableView(){
        let uiNIb = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentTableView.register(uiNIb, forCellReuseIdentifier: "StudentTableViewCell")
    }
}

extension StudentViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
        if indexPath.row % 2 == 0{
            studentTableViewCell.backgroundColor = .orange
            studentTableViewCell.studentNameLabel.text = "Pritam"
        } else {
            studentTableViewCell.backgroundColor = .systemPink
            studentTableViewCell.studentNameLabel.text = "Ronak"
        }
        
        return studentTableViewCell
    }
}


extension StudentViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath.row)
    }
}
