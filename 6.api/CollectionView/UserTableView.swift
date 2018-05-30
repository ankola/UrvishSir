//
//  UserTableView.swift
//  CollectionView
//
//  Created by agilemac-74 on 26/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit
typealias DidSelectUser = ((String)->())
class UserTableView: UITableView,UITableViewDataSource,UITableViewDelegate {

    var aryUserList:[String] = []
    
    private var didSelectUser:DidSelectUser?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setDidSelectHandler(withHandler handler:@escaping DidSelectUser){
        self.didSelectUser = handler
    }
    func setupTableView(withUserList users:[String]){
        self.aryUserList = users
        self.dataSource = self
        self.delegate = self 
    }
    //MARK: - Table Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryUserList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell:UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        userCell.clickButtonHandler = {
            print("IndexPath \(indexPath.row)")
            userCell.backgroundColor  = UIColor.red
            if let handler = self.didSelectUser {
                handler(self.aryUserList[indexPath.row])
            }
            
        }
        
        return userCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
    
}
