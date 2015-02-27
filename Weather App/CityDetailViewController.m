//
//  CityDetailViewController.m
//  Weather App
//
//  Created by User1 on 2/27/15.
//  Copyright (c) 2015 User1. All rights reserved.
//

#import "CityDetailViewController.h"

#import "City.h"

@interface CityDetailViewController()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;


@end

@implementation CityDetailViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the detail item
- (void)configureView
{
    // Update the user interface for the detail vehicle, if it exists.
    if (self.detailCity) {
        //Set the View Controller title, which will display in the Navigation bar.
        self.titleLabel.text = [self.detailCity cityTitleString];
        self.tempLabel.text = [self.detailCity cityTemp];
    }
}


@end
