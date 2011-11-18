//
//  ViewController.h
//  qr-iphone
//
//  Created by  on 2011/11/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ViewController : UIViewController <ZBarReaderViewDelegate>
{
    ZBarReaderView * _reader;
}

@property (retain, nonatomic) IBOutlet UILabel *text;
@property (retain, nonatomic) IBOutlet UIImageView *image_view;
- (IBAction)clicked:(id)sender;
@end
