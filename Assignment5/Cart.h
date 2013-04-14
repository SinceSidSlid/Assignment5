//
//  Cart.h
//  Assignment5
//
//  Created by Albert Miller on 4/9/13.
//  Copyright (c) 2013 Albert Miller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cart : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *fruit;
@end

@interface Cart (CoreDataGeneratedAccessors)

- (void)addFruitObject:(NSManagedObject *)value;
- (void)removeFruitObject:(NSManagedObject *)value;
- (void)addFruit:(NSSet *)values;
- (void)removeFruit:(NSSet *)values;

@end
