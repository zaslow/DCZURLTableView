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
