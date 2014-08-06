//
//  ViewController.h
//  5-1
//
//  Created by John Malloy on 5/3/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager * _locationManager;
}
@property (weak, nonatomic) IBOutlet UITextView *headingInformationView;
@property (weak, nonatomic) IBOutlet UISwitch *headingUpdatesSwitch;


-(IBAction)toggleHeadingUpdates:(id)sender;


@end
