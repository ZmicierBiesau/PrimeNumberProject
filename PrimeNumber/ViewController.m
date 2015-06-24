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
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

@end
