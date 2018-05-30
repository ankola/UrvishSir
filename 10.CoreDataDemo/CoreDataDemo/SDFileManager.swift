//
//  SDFileManager.swift
//  SQLiteDemo
//
//  Created by agilemac-24 on 5/10/18.
//  Copyright © 2018 agilemac-24. All rights reserved.
//

import UIKit

class SDFileManager: NSObject {
    
    var documentDirectoryPath = ""
    static let shared:SDFileManager = SDFileManager()
    var fileManager:FileManager = FileManager()
    
    override init()
    {
        super.init()
        documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
    func checkFileAvailableInLocalDirectory(withFileName name:String) -> Bool
    {
        let strFilePath:String = documentDirectoryPath.appending("/\(name)")
        
        return self.fileManager.fileExists(atPath: strFilePath)
    }
    func saveFile(at sourceFileLocation:String,to destinationFileLocation:String) -> Void
    {
        let aryContent:[String] = sourceFileLocation.components(separatedBy: ".")
        let fileName:String = aryContent.first!
        let fileType:String = aryContent.last!
        
        let sourceSqliteURLs = Bundle.main.url(forResource: fileName, withExtension: fileType)!
        let destinationSqliteURLs:URL = URL.init(fileURLWithPath: SDFileManager.shared.documentDirectoryPath.appending("/\(destinationFileLocation)"))
        
        do
        {
            try self.fileManager.copyItem(at: sourceSqliteURLs, to: destinationSqliteURLs)
        }
        catch{
            // print(error.localizedDescription)
        }
    }
    
}

