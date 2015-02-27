//
//  City.m
//  Weather App
//
//  Created by User1 on 2/27/15.
//  Copyright (c) 2015 User1. All rights reserved.
//

#import "City.h"

@implementation City



#pragma mark - Convenience Methods
-(NSString *)cityTitleString
{
    return [NSString stringWithFormat:@"%@", self.cityName];
}


-(NSString *)tempString
{
    return [NSString stringWithFormat:@"%@", self.cityTemp];
}

@end
