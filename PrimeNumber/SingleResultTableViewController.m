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
    if (self.detailItem) {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
        self.title = [format stringFromDate:[self.detailItem valueForKey:@"timeStamp"] ];        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [numberArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"numberCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"numberCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [numberArray objectAtIndex:indexPath.row]];
    
    return cell;
}




@end
