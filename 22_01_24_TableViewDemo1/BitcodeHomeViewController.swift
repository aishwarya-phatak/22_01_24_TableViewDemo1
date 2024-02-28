//
//  BitcodeHomeViewController.swift
//  22_01_24_TableViewDemo1
//
//  Created by Vishal Jagtap on 28/02/24.
//

import UIKit

class BitcodeHomeViewController: UIViewController {
    
    @IBOutlet weak var studentTableView: UITableView!
    var studentNames : [String] = ["Ronak","Pritam","Krishna","Dipali","Prasenjeet","Aditya","Tushar"]
    var studentTableViewCell : StudentTableViewCell?
    var uiNib : UINib?
    var studentDetailsViewController : StudentDetailsViewController?
    private var studentTableViewCellIdentifier = "StudentTableViewCell"
    private var studentDetailsViewControllerIndentifier = "StudentDetailsViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        registerCellWithTableView()
        
    }
    
    func initializeTableView(){
        studentTableView.delegate = self
        studentTableView.dataSource = self
    }
    
    func registerCellWithTableView(){
      uiNib = UINib(nibName: studentTableViewCellIdentifier, bundle: nil)
        self.studentTableView.register(uiNib!, forCellReuseIdentifier: studentTableViewCellIdentifier)
    }
}

extension BitcodeHomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: studentTableViewCellIdentifier, for: indexPath) as! StudentTableViewCell
        studentTableViewCell?.studentNameLabel.text = studentNames[indexPath.row]
        studentTableViewCell?.backgroundColor = .systemMint
        return studentTableViewCell!
    }
}

extension BitcodeHomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: studentDetailsViewControllerIndentifier) as! StudentDetailsViewController
        print("\(indexPath) --- \(studentNames[indexPath.row])")
        studentDetailsViewController?.nameContainer = studentNames[indexPath.row]
        self.navigationController?.pushViewController(studentDetailsViewController!, animated: true)
    }
}
