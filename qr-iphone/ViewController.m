//
//  ViewController.m
//  qr-iphone
//
//  Created by  on 2011/11/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ZBarImageScanner.h"

@implementation ViewController
@synthesize text;
@synthesize image_view;

- (void) readerView:(ZBarReaderView *)readerView didReadSymbols: (ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{    
    ZBarSymbol * s = nil;
    for (s in symbols)
    {
        text.text = s.data;
        image_view.image = image;
    }
}

- (void) init_camera
{
    ZBarReaderView * reader = [ZBarReaderView new];
    ZBarImageScanner * scanner = [ZBarImageScanner new];
    [scanner setSymbology:ZBAR_PARTIAL config:0 to:0]; 
    [reader initWithImageScanner:scanner];
    [scanner release];
    reader.readerDelegate = self;
    
    const float h = [UIScreen mainScreen].bounds.size.height;
    const float w = [UIScreen mainScreen].bounds.size.width;
    const float h_padding = w / 10.0;
    const float v_padding = h / 10.0;
    CGRect reader_rect = CGRectMake(h_padding, v_padding, 
                                    w - h_padding * 2.0, h / 3.0);    
    reader.frame = reader_rect;
    reader.backgroundColor = [UIColor redColor];
    [reader start];
    
    [self.view addSubview: reader];
    [reader release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self init_camera];
}

- (void)viewDidUnload
{
    [self setText:nil];
    [self setImage_view:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [text release];
    [image_view release];
    [super dealloc];
}
- (IBAction)clicked:(id)sender {
    [self dismissModalViewControllerAnimated:NO];
}
@end
