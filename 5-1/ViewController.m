//
//  ViewController.m
//  5-1
//
//  Created by John Malloy on 5/3/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)toggleHeadingUpdates:(id)sender
{
    if (self.headingUpdatesSwitch.on == YES)
    {
        if (self.headingUpdatesSwitch.on == YES)
        {
            //Heading data is not available on all devices
            if ([CLLocationManager headingAvailable])
            {
                self.headingInformationView.text = @"Heading services unavailable";
                self.headingUpdatesSwitch.on = NO;
                return;
            }
            if (_locationManager == nil)
            {
                _locationManager = [[CLLocationManager alloc] init];
                _locationManager.headingFilter = 5; //In Degress
                _locationManager.delegate = self;
            }
            
            [_locationManager startUpdatingHeading];
            self.headingInformationView.text = @"Starting heading tracking..";
        }
        else
        {
            //Switch was turned off
            self.headingInformationView.text = @"Stopped heading tracking";
            
            //Stop updates if they have been started
            if (_locationManager != nil)
            {
                [_locationManager stopUpdatingHeading];
            }
        }
    }
}



-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error while tracking heading: %@",error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSTimeInterval headingInterval = [newHeading.timestamp timeIntervalSinceNow];
    
    //Check if the reading is recent
    if(abs(headingInterval) < 30)
    {
        //Check if the reading is valid
        if (newHeading.headingAccuracy < 0)
            return;
        self.headingInformationView.text = [NSString stringWithFormat:@"%.1f°", newHeading.magneticHeading];
            
    }
}












@end
