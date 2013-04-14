//
//  ViewController.h
//  Assignment5
//
//  Created by Albert Miller on 4/9/13.
//  Copyright (c) 2013 Albert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>


@property (nonatomic, weak) IBOutlet UITableView * cartView;

@property (nonatomic, weak) IBOutlet UINavigationBar * nav;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * button;


-(IBAction)addCart:(id)sender;

@end
