//
//  CoreDataStack.swift
//  SOCoreDataStackContainer
//
//  Created by Overby, Sean on 6/19/15.
//  Copyright (c) 2015 Sean Overby. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataStack {
    
    var managedObjectModel: NSManagedObjectModel?
    var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    var persistentStore: NSPersistentStore?
    var privateMasterContext: NSManagedObjectContext?
    public var masterContext: NSManagedObjectContext?
    
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count - 1] as NSURL
    }()

    public init(modelURL: NSURL, databaseName: String) {
        self.managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)
        self.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel!)
        
        self.privateMasterContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        self.privateMasterContext!.persistentStoreCoordinator = self.persistentStoreCoordinator!
        self.privateMasterContext!.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        self.masterContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        self.masterContext!.parentContext = self.privateMasterContext
        self.masterContext!.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(databaseName)
        
        var error: NSError? = nil

        var options = [NSInferMappingModelAutomaticallyOption: true, NSMigratePersistentStoresAutomaticallyOption: true]
        if self.persistentStoreCoordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: options, error: &error) == nil {
            self.persistentStoreCoordinator = nil
            self.managedObjectModel = nil
            self.privateMasterContext = nil
            self.masterContext = nil
            NSLog("Failed to create or open persistent store with error \(error)")
            abort()
        }
    }
    
    public func saveContext(context: NSManagedObjectContext) {
        var contextStack = context
        while(contextStack !== self.privateMasterContext && contextStack.parentContext != nil) {
            contextStack.performBlockAndWait() {
                var error: NSError? = nil
                if !(contextStack.obtainPermanentIDsForObjects(contextStack.insertedObjects.allObjects, error: &error)) {
                    NSLog("Error obtaining permanent IDs for \(contextStack.insertedObjects.allObjects), \(error)")
                }
                
                if !(contextStack.save(&error)) {
                    NSLog("Unresolved core data error: \(error)")
                    abort()
                }
            }
            
            if let parentContext = contextStack.parentContext {
                contextStack = parentContext
            } else {
                break
            }
        }
        
        let persistToStore = self.privateMasterContext!
        
        persistToStore.performBlock({ () -> Void in
            var error: NSError? = nil
            if !(persistToStore.obtainPermanentIDsForObjects(persistToStore.insertedObjects.allObjects, error: &error)) {
                NSLog("Error obtaining permanent IDs for \(persistToStore.insertedObjects.allObjects), \(error)")
            }
            
            if !(persistToStore.save(&error)) {
                NSLog("Unresolved core data error: \(error)")
                abort()
            }

        })
    }
    
    public func writeContext() -> NSManagedObjectContext {
        let writeContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        writeContext.parentContext = self.masterContext
        writeContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return writeContext
    }
}