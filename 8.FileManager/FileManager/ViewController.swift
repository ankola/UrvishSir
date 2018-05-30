//
//  ViewController.swift
//  FileManager
//
//  Created by agilemac-74 on 04/05/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.FilemanagerContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func FilemanagerContent() {
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        print(documentDirectoryPath ?? "Not Get Path")
        
        let strCreateImageDirectory:String = "\(documentDirectoryPath!)/Images/1.png"
        
        let objFileManager:FileManager = FileManager()
        if objFileManager.fileExists(atPath: strCreateImageDirectory){
            //objFileManager.copyItem(at: , to: <#T##URL#>)
            //objFileManager.removeItem(at: <#T##URL#>)
        }
        
        do {
            
            try objFileManager.createDirectory(at:URL.init(fileURLWithPath: strCreateImageDirectory), withIntermediateDirectories: true , attributes: nil)
            
        }catch {
            print(error.localizedDescription)
        }
        
    }
}

