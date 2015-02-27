//
//  ListTableViewController.m
//  Weather App
//
//  Created by User1 on 2/27/15.
//  Copyright (c) 2015 User1. All rights reserved.
//

#import "ListTableViewController.h"
#import "City.h"
#import "CityDetailViewController.h"

@interface ListTableViewController() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *cities;
@end




@implementation ListTableViewController

#pragma mark - View Lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.cities = [NSMutableArray array];
    
    [self setupCitiesArray];
    
    self.tableView.backgroundColor = [UIColor blackColor];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Data setup

- (void)setupCitiesArray
{
    City *belgrade = [[City alloc] init];
    belgrade.cityName = @"Belgrade";
    belgrade.cityTemp = @"32C";
    
    [self.cities addObject:belgrade];
    
    City *novisad = [[City alloc] init];
    novisad.cityName = @"Novi Sad";
    novisad.cityTemp = @"22C";

    
    [self.cities addObject:novisad];
    
    City *subotica = [[City alloc] init];
    subotica.cityName = @"Subotica";
    subotica.cityTemp = @"24C";

    
    [self.cities addObject:subotica];
    
    City *nis = [[City alloc] init];
    nis.cityName = @"Nis";
    nis.cityTemp = @"13C";

    
    [self.cities addObject:nis];

}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    
    City *rowCity = self.cities[indexPath.row];
    cell.textLabel.text = [rowCity cityTitleString];
    
    
    if(indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor blueColor];
        cell.textLabel.textColor = [UIColor whiteColor];

    }
    else{
        cell.backgroundColor = [UIColor yellowColor];
        cell.textLabel.textColor = [UIColor redColor];

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
        {
            [self.cities removeObjectAtIndex:indexPath.row];
            [tableView reloadData];
        }
            break;
        case UITableViewCellEditingStyleInsert:
        {
            
        }
            break;

        case UITableViewCellEditingStyleNone:
        {
            
        }
            break;
    }
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}



#pragma mark - Segue Handling
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        City *selectedCity = self.cities[indexPath.row];
        [[segue destinationViewController] setDetailCity:selectedCity];
    }
}

@end
