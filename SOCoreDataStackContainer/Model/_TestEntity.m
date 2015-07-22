// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TestEntity.m instead.

#import "_TestEntity.h"

const struct TestEntityAttributes TestEntityAttributes = {
	.createDate = @"createDate",
	.entityId = @"entityId",
	.isActive = @"isActive",
	.name = @"name",
};

const struct TestEntityRelationships TestEntityRelationships = {
	.toDetail = @"toDetail",
};

@implementation TestEntityID
@end

@implementation _TestEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TestEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TestEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TestEntity" inManagedObjectContext:moc_];
}

- (TestEntityID*)objectID {
	return (TestEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"isActiveValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isActive"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic createDate;

@dynamic entityId;

@dynamic isActive;

- (BOOL)isActiveValue {
	NSNumber *result = [self isActive];
	return [result boolValue];
}

- (void)setIsActiveValue:(BOOL)value_ {
	[self setIsActive:@(value_)];
}

- (BOOL)primitiveIsActiveValue {
	NSNumber *result = [self primitiveIsActive];
	return [result boolValue];
}

- (void)setPrimitiveIsActiveValue:(BOOL)value_ {
	[self setPrimitiveIsActive:@(value_)];
}

@dynamic name;

@dynamic toDetail;

- (NSMutableSet*)toDetailSet {
	[self willAccessValueForKey:@"toDetail"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"toDetail"];

	[self didAccessValueForKey:@"toDetail"];
	return result;
}

@end

