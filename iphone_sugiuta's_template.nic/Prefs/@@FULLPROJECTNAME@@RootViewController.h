#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Cephei/HBPreferences.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <CepheiPrefs/HBLinkTableCell.h>
#import <spawn.h>
#import "NSTask.h"

@interface @@FULLPROJECTNAME@@RootViewController : HBRootListController
@property (nonatomic, retain) UIBarButtonItem *respringButton;
- (void)respring:(id)sender;
@end
