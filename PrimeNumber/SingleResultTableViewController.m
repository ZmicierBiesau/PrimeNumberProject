//
//  SingleResultTableViewController.m
//  PrimeNumber
//
//  Created by Zmicier Biesau on 2015-06-30.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import "SingleResultTableViewController.h"

@interface SingleResultTableViewController ()
{
    NSArray *numberArray;
}

@end

@implementation SingleResultTableViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        numberArray = [NSKeyedUnarchiver unarchiveObjectWithData:[self.detailItem valueForKey:@"numberData"]];
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [numberArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"numberCell"];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"numberCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [numberArray objectAtIndex:indexPath.row]];
    
    return cell;
}




@end
