//
//  Copyable.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 2/29/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation

class NSCopyableObject: NSObject, Copyable {
    var uuid: NSUUID
    var parentUUID: NSUUID?
    var archive: Bool
    var delete: Bool
 
    //MARK: Init  
    init(uuid:NSUUID? = nil, parentUUID:NSUUID? = nil, archive:Bool = false, delete:Bool = false){
        if let uuid = uuid {
            self.uuid = uuid
        } else {
            self.uuid = NSUUID()
        }
        self.parentUUID = parentUUID
        self.archive = archive
        self.delete = delete
        super.init()
    }
    
    required init(copy: AnyObject){
        let object = copy as! NSCopyableObject
        uuid = object.uuid
        parentUUID = object.parentUUID
        archive = object.archive
        delete = object.delete
        super.init()
    }
    
    required init(deepCopy: AnyObject){
        let object = deepCopy as! NSCopyableObject
        uuid = object.uuid
        parentUUID = object.parentUUID
        archive = object.archive
        delete = object.delete
        super.init()
    }
    
    // MARK: NSCopying
    func copyWithZone(zone: NSZone) -> AnyObject {
        return self.dynamicType.init(copy:self)
    }
    
    func mutableCopyWithZone(zone: NSZone) -> AnyObject {
        return self.dynamicType.init(deepCopy:self)
    }
}
