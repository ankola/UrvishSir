//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by agile on 04/12/17.
//  Copyright © 2017 agile. All rights reserved.
//

import UIKit
import CoreData
import FMDB
import SQLite3

struct Constant {
    static let databaseName:String = "demo.sqlite"
}
class ViewController: UIViewController {
    var db:OpaquePointer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchRecords()
        if !SDFileManager.shared.checkFileAvailableInLocalDirectory(withFileName: Constant.databaseName) {
            SDFileManager.shared.saveFile(at: Constant.databaseName, to: Constant.databaseName)
            
        }
        self.insert()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchRecords()
    {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Users")
//        fetchRequest.predicate = NSPredicate.init(format: " Name = 'ABC' ")
//        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: false)]
        do{
            try manageContext.fetch(<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>)
            if let users = try manageContext.fetch(fetchRequest) as? [User]
            {
                
                for user in users
                {
                    user.setValue("", forKey: "Name")
                    //print(user.value(forKey: "Name"))
                }
                try manageContext.save()
            }
            else
            {
                print("No record found")
            }
        }
        catch
        {
            print(error.localizedDescription)
        }

    }
    func addRecords()
    {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Users", into: manageContext)
        
        entity.setValue(Int16(1), forKey: "id")
        entity.setValue("ABC", forKey: "Name")
        
        do
        {
           try manageContext.save()
        
            
//            let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Users")
//            
//            try manageContext.fetch(request) as? NSManagedObject
            
            
        }
        catch
        {
            print(error.localizedDescription)
        }

        
        
    }
    func openDatabase() {
        
        var strPath:String = SDFileManager.shared.documentDirectoryPath
        strPath = strPath.appending("/\(Constant.databaseName)")
        print(strPath)
        
        if sqlite3_open(strPath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(strPath)")
            
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            
        }
        
    }
    func createTable() {
        
        self.openDatabase()
        let createTableString = """
    CREATE TABLE Contact(
    Id INT PRIMARY KEY NOT NULL,
Name CHAR(255));
"""
        
        // 1
        var createTableStatement: OpaquePointer? = nil
        // 2
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            // 3
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Contact table created.")
            } else {
                print("Contact table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        // 4
        sqlite3_finalize(createTableStatement)
        
        sqlite3_close(db)
        
    }
    
    
    
    
    func insert() {
        
        
        //SQLITE_BUSY, SQLITE_DONE, SQLITE_ROW, SQLITE_ERROR, or SQLITE_MISUSE
        
        
        self.openDatabase()
        let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
        
        var insertStatement: OpaquePointer? = nil
        
        // 1
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let id: Int32 = 1
            let name: NSString = "Ray"
            
            // 2
            sqlite3_bind_int(insertStatement, 1, id)
            // 3
            sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)
            
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
        
        sqlite3_close(db)
        
    }
    
    func query() {
        
        self.openDatabase()
        let queryStatementString = "SELECT * FROM Contact;"
        
        
        
        var queryStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // 2
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                // 3
                let id = sqlite3_column_int(queryStatement, 0)
                
                // 4
                let queryResultCol1 = sqlite3_column_text(queryStatement, 1)
                let name = String(cString: queryResultCol1!)
                
                // 5
                print("Query Result:")
                print("\(id) | \(name)")
                
            } else {
                print("Query returned no results")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        // 6
        sqlite3_finalize(queryStatement)
        
        sqlite3_close(db)
        
    }
    
    func update() {
        self.openDatabase()
        
        let updateStatementString = "UPDATE Contact SET Name = 'Chris' WHERE Id = 1;"
        
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not update row.")
            }
        } else {
            print("UPDATE statement could not be prepared")
        }
        sqlite3_finalize(updateStatement)
        
        sqlite3_close(db)
        
    }
    
    
    func delete() {
        
        self.openDatabase()
        
        let deleteStatementStirng = "DELETE FROM Contact WHERE Id = 1;"
        
        
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
        
        sqlite3_close(db)
        
        
    }
}

