//
//  PSMLightHighContrastTabStyle.m
//  iTerm2
//
//  Created by George Nachman on 3/25/16.
//
//

#import "PSMLightHighContrastTabStyle.h"
#import "PSMTabBarCell.h"
#import "PSMTabBarControl.h"

@implementation PSMLightHighContrastTabStyle

- (NSString *)name {
  return @"Light High Contrast";
}

- (NSColor *)textColorDefaultSelected:(BOOL)selected {
  return [NSColor blackColor];
}

- (NSColor *)accessoryTextColor {
  return [NSColor blackColor];
}

- (NSColor *)backgroundColorSelected:(BOOL)selected highlightAmount:(CGFloat)highlightAmount {
  if (selected) {
      // return [NSColor colorWithSRGBRed:0 green:0 blue:1 alpha:1];
      return [NSColor colorWithCalibratedWhite:0 alpha:1];
  } else {
    if ([self isYosemiteOrLater]) {
      CGFloat value = 180 / 255.0 - highlightAmount * 0.1;
      return [NSColor colorWithSRGBRed:value green:value blue:value alpha:1];
    } else {
      // 10.9 and earlier needs a darker color to look good
      CGFloat value = 230 / 255.0 - highlightAmount * 0.1;
      return [NSColor colorWithSRGBRed:value green:value blue:value alpha:1];
    }
  }
}

- (NSColor *)verticalLineColor {
    return [NSColor colorWithWhite:192.0 / 255.0 alpha:1];
}

- (NSColor *)topLineColorSelected:(BOOL)selected {
    if (selected) {
        return [super topLineColorSelected:selected];
    } else {
        return [self verticalLineColor];
    }
}

- (NSColor *)bottomLineColorSelected:(BOOL)selected {
    return [self verticalLineColor];
}

- (NSColor *)tabBarColor {
    return [NSColor colorWithCalibratedWhite:230 / 255.0 alpha:1];
}

- (CGFloat)fontSize {
  return 11.0;
}

@end
