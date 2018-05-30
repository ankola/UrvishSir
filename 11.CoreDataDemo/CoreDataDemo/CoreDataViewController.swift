//
//  CoreDataViewController.swift
//  CoreDataDemo
//
//  Created by agilemac-74 on 14/05/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(MMFileManager.shared.documentDirectoryPath)
        self.fetchRecord()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchRecord() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let manageContex = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
            //fetchRequest.predicate = NSPredicate.init(format: "id = 10")
            //let nameViseSorting = NSSortDescriptor.init(key: "name", ascending: false )
            //fetchRequest.sortDescriptors = [nameViseSorting]
            do{
                
                let resultData = try manageContex.fetch(fetchRequest)
                for user in resultData {
                    print(user.value(forKey: "id"))
                    print(user.value(forKey: "name"))
                    user.setValue("Dharshan", forKey: "name")
                    manageContex.delete(user)
                }
                
                try manageContex.save()
                
            }catch {
                
            }
            
            
        }
    }

    func insertRecord() {
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let manageContex = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Users", in: manageContex)!
            var user = NSManagedObject.init(entity: entity, insertInto: manageContex)
            
            user.setValue(10, forKey: "id")
            user.setValue("ABC", forKey: "name")
            
            
            do {
                try manageContex.save()
            }catch {
                
            }
        }
        
    
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
