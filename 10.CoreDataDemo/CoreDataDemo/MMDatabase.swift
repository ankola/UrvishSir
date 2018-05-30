//
//  MMDatabase.swift
//  SQLiteDemo
//
//  Created by agilemac-24 on 3/23/18.
//  Copyright © 2018 agilemac-24. All rights reserved.
//

import UIKit
import FMDB

protocol UserTableDelegate {
    
    
  func getUserList()
    
}

class MMDatabase: NSObject,UserTableDelegate {

    static let shared:MMDatabase = MMDatabase()
    var strDatabasePath:String = ""
    var queue:FMDatabaseQueue = FMDatabaseQueue.init()

    func getUserList() {
        
//        let dict1:[String:String] = ["1":"a","2":"a","3":"a","4":"a","5":"a","6":"b","7":"b","1":"b","2":"b","3":"b"]
//        let dict2:[String:String] = ["12":"c","11":"c","2":"c","1":"c","12":"c"]
//        var dict3:[String:String]  =
        
    }
    
    override init() {
        
        strDatabasePath = MMFileManager.shared.documentDirectoryPath.appending("/Test.sqlite")
        queue = FMDatabaseQueue.init(path: strDatabasePath)
        queue.inDatabase { (db) in
            db.executeStatements("Create table IF NOT EXISTS test ( no Int, name varchar)")
        }
        
        
        
        //FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:aPath];
        
    }
    
    func insertData(){
        queue.inDatabase { (db) in
            db.executeStatements("Insert into test ( no , name ) values ( 1 , 'ABC' )")
             db.executeStatements("Insert into test ( no , name ) values ( 2 , 'PQR' )")
             db.executeStatements("Insert into test ( no , name ) values ( 3 , 'JKL' )")
             db.executeStatements("Insert into test ( no , name ) values ( 4 , 'MNO' )")
            
        }
    }
    func selectData(){
        
        self.queue.inDatabase{ (db) in
            do{
                let resultSet:FMResultSet = try db.executeQuery("select * from test", values: nil)
                while resultSet.next(){
                    let total:Int = Int(resultSet.int(forColumn: "no"))
                    
                    print(total)
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
      
        
    }
}
