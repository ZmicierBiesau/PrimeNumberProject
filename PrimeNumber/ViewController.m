//
//  ViewController.m
//  PrimeNumber
//
//  Created by Maxvale on 22.06.15.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import "ViewController.h"
#import "PrimeNumberProvider.h"

@interface ViewController ()<PrimeNumberProviderDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSArray *generatedNumbers;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generateClick:(id)sender {
    [self.textField resignFirstResponder];
    
    PrimeNumberProvider *primeNumber = [[PrimeNumberProvider alloc] initWithDelegate:self];
    [primeNumber startGeneratingNumbersLessThen:[_textField.text integerValue]];
}

#pragma mark - UitableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [generatedNumbers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"generatedNumberIdentifier"];
    if (cell) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", generatedNumbers[indexPath.row]];
    }
    return cell;
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textField) {
        [self generateClick:textField];
        return NO;
    }
    return YES;
}

#pragma mark - PrimeNumber Provider Delegate
- (void) primeNumberProvider: (PrimeNumberProvider*) provider didGenerateArray: (NSArray*) generatedArray
{
    generatedNumbers = generatedArray;
    [_tableView reloadData];
}

@end
