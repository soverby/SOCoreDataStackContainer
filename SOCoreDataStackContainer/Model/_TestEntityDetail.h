// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TestEntityDetail.h instead.

@import CoreData;

extern const struct TestEntityDetailAttributes {
	__unsafe_unretained NSString *createDate;
	__unsafe_unretained NSString *entityId;
	__unsafe_unretained NSString *testField;
} TestEntityDetailAttributes;

extern const struct TestEntityDetailRelationships {
	__unsafe_unretained NSString *toParent;
} TestEntityDetailRelationships;

@class TestEntity;

@interface TestEntityDetailID : NSManagedObjectID {}
@end

@interface _TestEntityDetail : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TestEntityDetailID* objectID;

@property (nonatomic, strong) NSDate* createDate;

//- (BOOL)validateCreateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* entityId;

//- (BOOL)validateEntityId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* testField;

//- (BOOL)validateTestField:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) TestEntity *toParent;

//- (BOOL)validateToParent:(id*)value_ error:(NSError**)error_;

@end

@interface _TestEntityDetail (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreateDate;
- (void)setPrimitiveCreateDate:(NSDate*)value;

- (NSString*)primitiveEntityId;
- (void)setPrimitiveEntityId:(NSString*)value;

- (NSString*)primitiveTestField;
- (void)setPrimitiveTestField:(NSString*)value;

- (TestEntity*)primitiveToParent;
- (void)setPrimitiveToParent:(TestEntity*)value;

@end
