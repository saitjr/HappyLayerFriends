//
//  KMLyricsView.m
//  LyricsShow_Test
//
//  Created by nali on 16/9/14.
//  Copyright © 2016年 Kimi. All rights reserved.
//

#define USE_DEBUG 0

#import "KMLyricsView.h"

@implementation KMLyricsView
{
    CGRect              _selfBounds;
    CGPoint             _selfBoundsCenter;
    CGFloat             _selfBoundsX;
    CGFloat             _selfBoundsY;
    CGFloat             _selfBoundsWidth;
    CGFloat             _selfBoundsHeight;
    
    CAGradientLayer     *_gradientLayer;
    CABasicAnimation    *_scrollAnimation;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBoundsAndFrame];
        [self drawLyricsView];
        
#if USE_DEBUG
        self.backgroundColor = [UIColor lightGrayColor];
#else
        self.backgroundColor = [UIColor clearColor];
#endif

    }
    return self;
}

- (void)layoutSubviews
{
    [self setupBoundsAndFrame];
    [self reloadLyricsView];
}

- (void)setupBoundsAndFrame
{
    _selfBounds       = self.bounds;
    _selfBoundsX      = _selfBounds.origin.x;
    _selfBoundsY      = _selfBounds.origin.y;
    _selfBoundsWidth  = _selfBounds.size.width;
    _selfBoundsHeight = _selfBounds.size.height;
    _selfBoundsCenter = CGPointMake(_selfBoundsX + _selfBoundsWidth/2,
                                    _selfBoundsY + _selfBoundsHeight/2);
}

- (void)drawLyricsView
{
    if (_gradientLayer) {
        [_gradientLayer removeFromSuperlayer];
    }
    
    _gradientLayer = [self createGridientLayerWithDidReadColor:_lyricsDidReadColor unreadColor:_lyricsUnreadColor];
    [self.layer addSublayer:_gradientLayer];
    
    UIImage *lyricsTextImage = [self createLyricsTextImageView];
    CALayer *maskLayer = [self createLyricsTextMaskLayerWithAnImage:lyricsTextImage];
    _gradientLayer.mask = maskLayer;
    
    [self addLyricsAnimation];
}

- (void)reloadLyricsView
{
//    if (!_gradientLayer) {
//        [self drawLyricsView];
//    }
//    else {
//        _gradientLayer.frame = _selfBounds;
//    }
    [self drawLyricsView];
}

#pragma mark - setUpLyricsColor
- (void)setLyricsDidReadColor:(UIColor *)lyricsDidReadColor
{
    if (!_gradientLayer) {
        [self drawLyricsView];
    }
    
    _lyricsDidReadColor = lyricsDidReadColor;
    
    [self reloadLyricsView];
}

- (void)setLyricsUnreadColor:(UIColor *)lyricsUnreadColor
{
    if (!_gradientLayer) {
        [self drawLyricsView];
    }
    
    _lyricsUnreadColor = lyricsUnreadColor;
    
    [self reloadLyricsView];
}

- (CAGradientLayer *)createGridientLayerWithDidReadColor:(UIColor *)color1 unreadColor:(UIColor *)color2
{
    UIColor *didReadColor = (color1)? color1 : [UIColor greenColor];
    UIColor *unreadColor = (color2)? color2 : [UIColor grayColor];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = _selfBounds;
    gradientLayer.colors = @[(__bridge id)didReadColor.CGColor,
                             (__bridge id)unreadColor.CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    return gradientLayer;
}

- (UIImage *)createLyricsTextImageView
{
    NSString *text = @"Hello Music!";
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attributesDic = @{
                                    NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:50.0],
                                    NSParagraphStyleAttributeName : style
                                    };
    
    UIGraphicsBeginImageContextWithOptions(_selfBounds.size, NO, 0.0);
    [text drawInRect:_selfBounds withAttributes:attributesDic];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return textImage;
}

- (CALayer *)createLyricsTextMaskLayerWithAnImage:(UIImage *)image
{
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(_selfBoundsX, _selfBoundsY, _selfBoundsWidth, _selfBoundsHeight);
    maskLayer.position = CGPointMake(_selfBoundsCenter.x, _selfBoundsCenter.y+_selfBoundsHeight/4);
    maskLayer.contents = (__bridge id)image.CGImage;
    
    return maskLayer;
}

- (CABasicAnimation *)createScrollAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = @[@0.0, @0.05];
    animation.toValue = @[@0.95, @1.0];
    animation.duration = 3.0;
    animation.repeatCount = FLT_MAX;
    
    return animation;
}

- (void)addLyricsAnimation
{
    [_gradientLayer removeAllAnimations];
    _scrollAnimation = [self createScrollAnimation];
    [_gradientLayer addAnimation:_scrollAnimation forKey:@"LocationAnimation"];
}

@end
