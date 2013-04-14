//
//  ViewController.m
//  Assignment5
//
//  Created by Albert Miller on 4/9/13.
//  Copyright (c) 2013 Albert Miller. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Fruit.h"
#import "Cart.h"
#import "CartTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        int cartCount = [Cart MR_countOfEntities];
        if (cartCount == 0) {
            UIAlertView * createCartAlert = [[UIAlertView alloc] init];
            createCartAlert.delegate = self;
            createCartAlert.title = @"Create a Cart";
            createCartAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
            createCartAlert.message = @"Please give a name to the cart!";
            
            
            [createCartAlert addButtonWithTitle:@"Enter"];
            [createCartAlert show];
            NSLog(@"Test 1");
                    }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Carts";
   
    UIBarButtonItem * item = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                              target:self
                              action:@selector(addCart:)];
    
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
    int cartCount = [Cart MR_countOfEntities];
    
    if(section == 0){
        return cartCount;
    }
    else
    {
        return 1;
    }
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Testing");
    
    NSArray * fetchedCarts = [Cart MR_findAll];
    Cart * selectedCart = [fetchedCarts objectAtIndex:indexPath.row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CartTableViewController * detailView = [[CartTableViewController alloc] initWithNibName:@"CartTableViewController" bundle:nil];
    
    detailView.title = selectedCart.name;
    detailView.cartStore = selectedCart;
    
    [self.navigationController pushViewController:detailView animated:YES];
      
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
 UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AbsentCell"];
 if(cell == nil){
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AbsentCell"];
 }
    if(indexPath.section == 0){
        
        
        NSArray *fetchedCarts = [Cart MR_findAll];
        
        NSString * cellLabel = [NSString stringWithFormat:@"%@ - %d", ((Cart *)[fetchedCarts objectAtIndex:indexPath.row]).name, indexPath.row];
        
        cell.textLabel.text =  cellLabel;
            return cell;
        
    }
    return cell;
}

-(IBAction)addCart:(id)sender
{
    UIAlertView * createCartAlert = [[UIAlertView alloc] init];
    createCartAlert.delegate = self;
    createCartAlert.title = @"Create a Cart";
    createCartAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    createCartAlert.message = @"Please give a name to the cart!";
    
    
    [createCartAlert addButtonWithTitle:@"Enter"];
    [createCartAlert show];
    NSLog(@"Test 1");
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString * buttonPressedName = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([buttonPressedName isEqualToString: @"Enter"])
    {
        UITextField * promptField = [alertView textFieldAtIndex:0];
        NSString * cartName = promptField.text;
        
        Cart * newObject = [Cart MR_createEntity];
        newObject.name = cartName;
        [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
        [self.cartView reloadData];
        
    }
}

@end
