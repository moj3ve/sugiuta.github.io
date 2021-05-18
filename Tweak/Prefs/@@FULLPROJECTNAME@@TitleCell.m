#include "@@FULLPROJECTNAME@@RootViewController.h"
#include <spawn.h>

#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>


@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;
@end

@interface @@FULLPROJECTNAME@@TitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView *bgView;
    UILabel *packageNameLabel;
    UILabel *developerLabel;
    UILabel *versionLabel;
}

@end

@implementation @@FULLPROJECTNAME@@TitleCell 

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {

		int width = self.contentView.bounds.size.width;
    
    CGRect nameFrame = CGRectMake(40, 75, width, 50);
    CGRect developerFrame = CGRectMake(40, 110, width, 50);
    CGRect versionFrame = CGRectMake(140, 110, width, 50);

    
    packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
    [packageNameLabel setFont:[UIFont systemFontOfSize:45 weight: UIFontWeightSemibold] ];
    packageNameLabel.textColor = [UIColor whiteColor];
    packageNameLabel.text = @"@@FULLPROJECTNAME@@";
    
    developerLabel = [[UILabel alloc] initWithFrame:developerFrame];
    [developerLabel setFont:[UIFont systemFontOfSize:25 weight: UIFontWeightMedium] ];
    developerLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
    developerLabel.text = @"Sugi.uta";
    
    
    versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
    [versionLabel setFont:[UIFont systemFontOfSize:22 weight: UIFontWeightMedium] ];
    versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    versionLabel.text = @"0.0.1";
    
    bgView.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.0];
   
    [self addSubview:packageNameLabel];
    [self addSubview:developerLabel];
    [self addSubview:versionLabel];

UIImage *image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"/Library/PreferenceBundles/@@FULLPROJECTNAME@@.bundle/bigIcon.png"]];

UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake(195,80,40,40)];
imageView.image = image;

[self addSubview:imageView];

    }
    	return self;

}

- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WotsitBetaTitleCell" specifier:specifier];
}

- (void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1{
    return 215.0f;
}


-(void)layoutSubviews{
	[super layoutSubviews];
	int width = self.contentView.bounds.size.width;
    CGRect frame = CGRectMake(0, 0, width, 215);

    bgView = [[UIView alloc] initWithFrame:frame];

     UIColor *topColor = [UIColor colorWithRed:1.00 green:0.5 blue:0.7 alpha:1.0];
    UIColor *bottomColor = [UIColor colorWithRed:1.00 green:0.7 blue:0.72 alpha:1.0];

    CAGradientLayer *theViewGradient = [CAGradientLayer layer];
    theViewGradient.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    theViewGradient.startPoint = CGPointMake(0.4, 0.0);
    theViewGradient.endPoint = CGPointMake(1.0, 1.0);
    theViewGradient.frame = bgView.bounds;

    //Add gradient to view
    [bgView.layer insertSublayer:theViewGradient atIndex:0];
    [self insertSubview:bgView atIndex:0];

}


- (CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}

@end

