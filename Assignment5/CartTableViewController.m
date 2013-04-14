//
//  CartView.m
//  Assignment5
//
//  Created by Albert Miller on 4/9/13.
//  Copyright (c) 2013 Albert Miller. All rights reserved.
//

#import "CartTableViewController.h"
#import "Fruit.h"
#import "Cart.h"
#import "AppDelegate.h"

@interface CartTableViewController ()

@end

@implementation CartTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                              target:self
                              action:@selector(addFruit:)];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return [[self.cartStore fruit] count];
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AbsentCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AbsentCell"];
    }
    
    
       
        
        NSArray *fetchedObjects = [[self.cartStore fruit] allObjects];
        
        
        NSString * cellLabel = [NSString stringWithFormat:@"%@ - %d", ((Fruit *)[fetchedObjects objectAtIndex:indexPath.row]).name, indexPath.row];
        
        cell.textLabel.text =  cellLabel;
        return cell;
    
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

-(IBAction)addFruit:(id)sender
{
    UIAlertView * createCartAlert = [[UIAlertView alloc] init];
    createCartAlert.delegate = self;
    createCartAlert.title = @"Create Some Fruit";
    createCartAlert.alertViewStyle = UIAlertViewStyleDefault;
    createCartAlert.message = @"Pick Something Tasty!";
    
    
    [createCartAlert addButtonWithTitle:@"Kiwi"];
    [createCartAlert addButtonWithTitle:@"Grapefruit"];
    [createCartAlert addButtonWithTitle:@"Boysenberry"];
    [createCartAlert addButtonWithTitle:@"Cancel"];
    
    [createCartAlert show];
    NSLog(@"Test 1");
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString * buttonPressedName = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([buttonPressedName isEqualToString: @"Kiwi"])
    {
        NSString * fruitName = @"Kiwi";
        
        Fruit * newObject = [Fruit MR_createEntity];
        newObject.name = fruitName;
        newObject.shape = @"Egg";
        newObject.color = @"Brown";
        
        
        [self.cartStore addFruitObject:newObject];
        [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
        [self.cartView reloadData];
        
    }
    if([buttonPressedName isEqualToString: @"Grapefruit"])
    {
        NSString * fruitName = @"Grapefruit";
        
        Fruit * newObject = [Fruit MR_createEntity];
        newObject.name = fruitName;
        newObject.shape = @"Round";
        newObject.color = @"Orange";
        [self.cartStore addFruitObject:newObject];
        [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
        [self.cartView reloadData];
    }
    if([buttonPressedName isEqualToString: @"Boysenberry"])
    {
       
        NSString * fruitName = @"Boysenberry";
        
        Fruit * newObject = [Fruit MR_createEntity];
        newObject.name = fruitName;
        newObject.shape = @"Lumpy";
        newObject.color = @"Violet";
        [self.cartStore addFruitObject:newObject];
        [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
        [self.cartView reloadData];
        
    }
    
}

@end
