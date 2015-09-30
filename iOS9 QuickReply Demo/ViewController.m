//
//  ViewController.m
//  iOS9 QuickReply Demo
//
//  Created by Mokhlas Hussein on 30/09/15.
//  Copyright © 2015 iMokhles. All rights reserved.
//

#import "ViewController.h"
#import "NotificationsMethods.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveQuickReply:) name:@"QuickReplyGotTextNotification" object:nil];
}

- (void)receiveQuickReply:(NSNotification *)notification {
    NSString *qrText = [notification object];
    [_testLabel setText:qrText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testAction:(id)sender {
    NotificationsMethods *method = [[NotificationsMethods alloc] init];
    [method presentNotificationNow];
}

@end
