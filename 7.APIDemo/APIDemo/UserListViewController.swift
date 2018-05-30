
//
//  UserListViewController.swift
//  APIDemo
//
//  Created by agilemac-74 on 02/05/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    var aryUserList:[AIUser] = []
    @IBOutlet var tblUserList:UserTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.generateData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func generateData(){
        let aryAPIUserList:[[String:Any]] = self.getDataFromAPI()
        print(aryAPIUserList)
        for user in aryAPIUserList {
            let objUser:AIUser = AIUser.init(withDetails: user)
            self.aryUserList.append(objUser)
        }
        
        tblUserList.setupTableView(withUserList: self.aryUserList)
        tblUserList.setDidSelectHandler { (user) in
            print(user.city)
        }
        
    }
    func getDataFromAPI() -> [[String:Any]]{
        
        var aryUsers:[[String:Any]] = []
        
        var dictUsers:[String:Any] = [:]
        dictUsers[USER_KEYS.firstName] = "abc"
        dictUsers[USER_KEYS.lastName] = "xyz"
        dictUsers[USER_KEYS.number] = "9874566514"
        dictUsers[USER_KEYS.city] = "Surat"
        dictUsers[USER_KEYS.zipcode] = "384458"
        aryUsers.append(dictUsers)
        
        
        dictUsers = [:]
        dictUsers[USER_KEYS.firstName] = "qwe"
        dictUsers[USER_KEYS.lastName] = "rty"
        dictUsers[USER_KEYS.number] = "9874566514"
        dictUsers[USER_KEYS.city] = "Ahmedabad"
        dictUsers[USER_KEYS.zipcode] = "384458"
        aryUsers.append(dictUsers)
        
        dictUsers = [:]
        dictUsers[USER_KEYS.firstName] = "abc"
        dictUsers[USER_KEYS.lastName] = "xyz"
        dictUsers[USER_KEYS.number] = "9874566514"
        dictUsers[USER_KEYS.city] = "Delhi"
        dictUsers[USER_KEYS.zipcode] = "384458"
        aryUsers.append(dictUsers)
        
        dictUsers = [:]
        dictUsers[USER_KEYS.firstName] = "abc"
        dictUsers[USER_KEYS.lastName] = "xyz"
        dictUsers[USER_KEYS.number] = "9874566514"
        dictUsers[USER_KEYS.city] = "Rajkot"
        dictUsers[USER_KEYS.zipcode] = "384458"
        aryUsers.append(dictUsers)
        
        
        dictUsers = [:]
        dictUsers[USER_KEYS.firstName] = "abc"
        dictUsers[USER_KEYS.lastName] = "xyz"
        dictUsers[USER_KEYS.number] = "9874566514"
        dictUsers[USER_KEYS.city] = "Bhuj"
        dictUsers[USER_KEYS.zipcode] = "384458"
        aryUsers.append(dictUsers)
        
        return aryUsers
        
    }

 
}
