//
//  NotificationsMethods.m
//  iOS9 QuickReply Demo
//
//  Created by Mokhlas Hussein on 30/09/15.
//  Copyright © 2015 iMokhles. All rights reserved.
//

#import "NotificationsMethods.h"

@implementation NotificationsMethods
- (void)setupNotifications {
    UIMutableUserNotificationAction *textAction = [[UIMutableUserNotificationAction alloc] init];
    textAction.identifier = @"quickreply_action";
    textAction.title = @"Quick Reply";
    textAction.activationMode = UIUserNotificationActivationModeForeground;
    textAction.authenticationRequired = YES;
    textAction.behavior = UIUserNotificationActionBehaviorTextInput;
    
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc]init];
    category.identifier = @"category_qr";
    [category setActions:@[textAction] forContext:UIUserNotificationActionContextMinimal];
    NSSet *categories = [NSSet setWithObjects:category, nil];
    
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeSound |UIUserNotificationTypeBadge;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
                                                                             categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
}
- (void)presentNotificationNow {
    UILocalNotification *reminder = [[UILocalNotification alloc] init];
    reminder.alertBody = @"Received new alert";
    reminder.alertTitle = @"QuickReply Demo";
    reminder.category = @"category_qr";
    [[UIApplication sharedApplication] presentLocalNotificationNow:reminder];
}
@end
