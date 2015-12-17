//
//  ViewController.m
//  PrimeNumber
//
//  Created by Maxvale on 22.06.15.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import "ViewController.h"
#import "PrimeNumberProvider.h"
#import "AppDelegate.h"

@interface ViewController ()<PrimeNumberProviderDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *generateButton;
@property (weak, nonatomic) IBOutlet UIButton *historyButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController
{
    NSArray *generatedNumbers;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_activityIndicator setHidden:YES];
    self.generateButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.historyButton.titleLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generateClick:(id)sender {
    [self.textField resignFirstResponder];
    
    if ([_textField.text integerValue] > NSIntegerMax) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your number is bigger than possible" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if ([_textField.text integerValue] < 2) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your number is less than the smallest prime number" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if ([_textField.text integerValue] > 1000000) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"It may take a long time to count them all" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    
    [_generateButton setEnabled:NO];
    [_generateButton setTitle:@"Generating" forState:UIControlStateNormal];
    [_activityIndicator setHidden:NO];
    [_activityIndicator startAnimating];
    [_tableView setUserInteractionEnabled:NO];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"generatedNumberIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"generatedNumberIdentifier"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", generatedNumbers[indexPath.row]];
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  {
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    return [string isEqualToString:filtered];
}

#pragma mark - PrimeNumber Provider Delegate
- (void) primeNumberProvider: (PrimeNumberProvider*) provider didGenerateArray: (NSArray*) generatedArray
{
    generatedNumbers = generatedArray;
    [_tableView reloadData];
    [_generateButton setTitle:@"Generate" forState:UIControlStateNormal];
    [_generateButton setEnabled:YES];
    [_activityIndicator stopAnimating];
    [_activityIndicator setHidden:YES];
    [_tableView setUserInteractionEnabled:YES];
}

@end
