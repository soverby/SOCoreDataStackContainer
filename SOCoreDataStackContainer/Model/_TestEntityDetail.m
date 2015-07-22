// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TestEntityDetail.m instead.

#import "_TestEntityDetail.h"

const struct TestEntityDetailAttributes TestEntityDetailAttributes = {
	.createDate = @"createDate",
	.entityId = @"entityId",
	.testField = @"testField",
};

const struct TestEntityDetailRelationships TestEntityDetailRelationships = {
	.toParent = @"toParent",
};

@implementation TestEntityDetailID
@end

@implementation _TestEntityDetail

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TestEntityDetail" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TestEntityDetail";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TestEntityDetail" inManagedObjectContext:moc_];
}

- (TestEntityDetailID*)objectID {
	return (TestEntityDetailID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic createDate;

@dynamic entityId;

@dynamic testField;

@dynamic toParent;

@end

