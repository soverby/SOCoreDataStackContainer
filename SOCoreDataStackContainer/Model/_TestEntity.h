// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TestEntity.h instead.

@import CoreData;

extern const struct TestEntityAttributes {
	__unsafe_unretained NSString *createDate;
	__unsafe_unretained NSString *entityId;
	__unsafe_unretained NSString *isActive;
	__unsafe_unretained NSString *name;
} TestEntityAttributes;

extern const struct TestEntityRelationships {
	__unsafe_unretained NSString *toDetail;
} TestEntityRelationships;

@class TestEntityDetail;

@interface TestEntityID : NSManagedObjectID {}
@end

@interface _TestEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TestEntityID* objectID;

@property (nonatomic, strong) NSDate* createDate;

//- (BOOL)validateCreateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* entityId;

//- (BOOL)validateEntityId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* isActive;

@property (atomic) BOOL isActiveValue;
- (BOOL)isActiveValue;
- (void)setIsActiveValue:(BOOL)value_;

//- (BOOL)validateIsActive:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *toDetail;

- (NSMutableSet*)toDetailSet;

@end

@interface _TestEntity (ToDetailCoreDataGeneratedAccessors)
- (void)addToDetail:(NSSet*)value_;
- (void)removeToDetail:(NSSet*)value_;
- (void)addToDetailObject:(TestEntityDetail*)value_;
- (void)removeToDetailObject:(TestEntityDetail*)value_;

@end

@interface _TestEntity (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreateDate;
- (void)setPrimitiveCreateDate:(NSDate*)value;

- (NSString*)primitiveEntityId;
- (void)setPrimitiveEntityId:(NSString*)value;

- (NSNumber*)primitiveIsActive;
- (void)setPrimitiveIsActive:(NSNumber*)value;

- (BOOL)primitiveIsActiveValue;
- (void)setPrimitiveIsActiveValue:(BOOL)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveToDetail;
- (void)setPrimitiveToDetail:(NSMutableSet*)value;

@end
