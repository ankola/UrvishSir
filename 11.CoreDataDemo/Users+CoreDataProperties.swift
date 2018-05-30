//
//  Users+CoreDataProperties.swift
//  
//
//  Created by agilemac-74 on 12/05/18.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?

}
