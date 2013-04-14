//
//  CartViewController.h
//  Assignment5
//
//  Created by Albert Miller on 4/9/13.
//  Copyright (c) 2013 Albert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cart.h"

@interface CartTableViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView * cartView;

@property (nonatomic, strong) Cart *cartStore;

-(IBAction)addFruit:(id)sender;

@end
