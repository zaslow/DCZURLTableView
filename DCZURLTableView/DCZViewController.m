//
//  ViewController.m
//  DCZURLTableView
//
//  Created by Zaslow, Dean Clayton on 4/22/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZViewController.h"

@interface DCZViewController ()

@end

@implementation DCZViewController

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
        cell.textLabel.text = [pageNames objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{

    return [pageNames count];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    _pageURL = [URLs objectAtIndex:indexPath.row];
    [self alert:[pageNames objectAtIndex:indexPath.row]];
}

#pragma mark - UIAlertView

- (void)alert:(NSString *)webPage {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                   message:[NSString stringWithFormat:@"Are you sure you want to visit %@", webPage]
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"Ok", nil];
    
    [alert show];
}

#pragma mark - UIAlerViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_pageURL]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Populate URL & PageName arrays
    URLs = [[NSArray alloc] initWithObjects:@"http://www.github.com/", @"http://www.lynda.com/", @"http://www.w3schools.com/", @"http://www.wikipedia.org/", @"http://www.linkedin.com/", nil];
    pageNames = [[NSArray alloc] initWithObjects:@"GitHub", @"Lynda.com", @"W3Schools", @"Wikipedia", @"LinkedIn", nil];
    
    // Configure the UITableView
    _tblView = [[UITableView alloc] initWithFrame:CGRectMake(10,0,300,self.view.frame.size.height)
                                           style:UITableViewStyleGrouped];
    _tblView.backgroundColor = [UIColor clearColor];
    
    // Set DataSource & Delegate
    _tblView.dataSource = self;
    _tblView.delegate = self;
    
    // Add UITableView to main view
    [self.view addSubview:_tblView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
