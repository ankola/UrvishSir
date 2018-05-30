//
//  ViewController.swift
//  TableViewWithXIB
//
//  Created by agilemac-74 on 24/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tblUsers:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupUI()
    }

    func  setupUI(){
        self.tblUsers.register(UINib.init(nibName: "UserDetailsCell", bundle: nil), forCellReuseIdentifier: "UserDetailCell")
        self.tblUsers.delegate = self
        self.tblUsers.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Mark: - TableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
      //  let cell:UserNameCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserNameCell
        let cell:UserDetailsCell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell") as! UserDetailsCell
        cell.lblName.text = " Index Path \(indexPath.row)"
        cell.accessoryType = .checkmark
        cell.accessoryView  = 
        return cell
    }
}

