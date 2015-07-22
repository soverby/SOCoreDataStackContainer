//
//  SOCoreDataStackContainerTests.swift
//  SOCoreDataStackContainerTests
//
//  Created by Overby, Sean on 6/19/15.
//  Copyright (c) 2015 Sean Overby. All rights reserved.
//

import UIKit
import XCTest
import CoreData
import SOCoreDataStack

class SOCoreDataStackContainerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOneRowInsert() {
        println(" start")
        if let modelURL = NSBundle.mainBundle().URLForResource("TestModel", withExtension: "momd") {
            println(" modelURL \(modelURL)")
            let coreDataStack = CoreDataStack(modelURL: modelURL, databaseName: "testDatabase")
            XCTAssertNotNil(coreDataStack)
            let writeMOC = coreDataStack.writeContext()
            XCTAssertNotNil(writeMOC)
            let newTestEntity: TestEntity = NSEntityDescription.insertNewObjectForEntityForName(TestEntity.entityName(), inManagedObjectContext: writeMOC) as TestEntity
            XCTAssertNotNil(newTestEntity)
            let storeUUID = NSUUID().UUIDString
            newTestEntity.entityId = storeUUID
            newTestEntity.createDate = NSDate()
            newTestEntity.name = "TestThisEntity"
            newTestEntity.isActive = true
            println(" saving context")
            coreDataStack.saveContext(writeMOC)
            println(" saved")
            let mainMOC = coreDataStack.masterContext!
            let fetchRequest = NSFetchRequest(entityName: TestEntity.entityName())
            fetchRequest.predicate = NSPredicate(format: "%K like %@", TestEntityAttributes.entityId, storeUUID)
            fetchRequest.sortDescriptors = [ NSSortDescriptor(key: TestEntityAttributes.entityId, ascending: true) ]
            let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: mainMOC, sectionNameKeyPath: nil, cacheName: nil)
            var error: NSError?
            frc.performFetch(&error)
            if let rows = frc.fetchedObjects {
                XCTAssertEqual(rows.count, 1)
            } else {
                XCTFail("Fetched objects is nil")
            }
//            println(" how many fetched? \(frc.fetchedObjects!.count)")
        } else {
            XCTFail(" Could not find model URL in bundle")
        }
    }
    
}
