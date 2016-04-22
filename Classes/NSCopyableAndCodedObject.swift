//
//  NSCopyableAndCodedObject.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/12/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation


class NSCopyableAndCodedObject: NSObject, NSCoding, Copyable {
    
    //MARK: Properties
    struct PropertyKey {
        static let uuidKey = "uuid"
        static let parentUUIDKey = "parentUUID"
        static let archiveKey = "archive"
        static let deleteKey = "delete"
    }
    
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
    
    //MARK: Copy Init
    required init(copy: AnyObject){
        let object = copy as! NSCopyableAndCodedObject
        uuid = object.uuid
        parentUUID = object.parentUUID
        archive = object.archive
        delete = object.delete
        super.init()
    }
    
    required init(deepCopy: AnyObject){
        let object = deepCopy as! NSCopyableAndCodedObject
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

    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(uuid, forKey:  PropertyKey.uuidKey)
        aCoder.encodeObject(parentUUID, forKey:  PropertyKey.parentUUIDKey)
        aCoder.encodeObject(archive, forKey:  PropertyKey.archiveKey)
        aCoder.encodeObject(delete, forKey:  PropertyKey.deleteKey)
    }
    
    required init(coder aDecoder:NSCoder) {
        uuid = aDecoder.decodeObjectForKey(PropertyKey.uuidKey) as? NSUUID ?? NSUUID()
        parentUUID = aDecoder.decodeObjectForKey(PropertyKey.parentUUIDKey) as? NSUUID
        archive = aDecoder.decodeObjectForKey(PropertyKey.archiveKey) as? Bool ?? false
        delete = aDecoder.decodeObjectForKey(PropertyKey.deleteKey) as? Bool ?? false
        super.init()
    }
    
}