//
//  Fruit.h
//  Assignment5
//
//  Created by Albert Miller on 4/9/13.
//  Copyright (c) 2013 Albert Miller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cart;

@interface Fruit : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * shape;
@property (nonatomic, retain) Cart *cart;

@end
