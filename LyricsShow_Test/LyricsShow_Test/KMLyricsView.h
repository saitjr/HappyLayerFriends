//
//  KMLyricsView.h
//  LyricsShow_Test
//
//  Created by nali on 16/9/14.
//  Copyright © 2016年 Kimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMLyricsView : UIView

@property (strong, nonatomic) UIColor  *lyricsDidReadColor; //!< 歌词已读颜色
@property (strong, nonatomic) UIColor  *lyricsUnreadColor;  //!< 歌词未读颜色
@property (strong, nonatomic) NSString *lyricsText;         //!< 歌词内容
- (instancetype)initWithFrame:(CGRect)frame;
@end
