//
//  ViewController.m
//  LyricsShow_Test
//
//  Created by nali on 16/9/14.
//  Copyright © 2016年 Kimi. All rights reserved.
//

#import "ViewController.h"
#import "KMLyricsView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    KMLyricsView *_lyricsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    _lyricsView = [[KMLyricsView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 100.0)];
    _lyricsView.center = self.view.center;
    [self.view addSubview:_lyricsView];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickChangeColors:(UIButton *)sender {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    UIColor *didReadColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    UIColor *unreadColor = [UIColor colorWithRed:(1.0-red) green:(1.0-green) blue:(1.0-blue) alpha:1.0];
    _lyricsView.lyricsDidReadColor = didReadColor;
    _lyricsView.lyricsUnreadColor = unreadColor;
}

@end
