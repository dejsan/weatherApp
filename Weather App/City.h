//
//  City.h
//  Weather App
//
//  Created by User1 on 2/27/15.
//  Copyright (c) 2015 User1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface City : UITableViewController

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *cityTemp;


-(NSString *)cityTitleString;
-(NSString *)tempString;

@end
