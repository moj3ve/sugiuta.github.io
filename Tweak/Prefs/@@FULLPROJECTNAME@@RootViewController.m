
#include "@@FULLPROJECTNAME@@RootViewController.h"

@implementation @@FULLPROJECTNAME@@RootViewController

- (id)specifiers {
	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
	return _specifiers;
}

- (instancetype)init
{
    self = [super init];

    if (self)
	{
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:69/255.0 green:13/255.0 blue:89/255.0 alpha:1.0];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithRed:23/255.0 green:170/255.0 blue:170/255.0 alpha:0.0];
		appearanceSettings.navigationBarTitleColor = [UIColor colorWithRed:69/255.0 green:13/255.0 blue:89/255.0 alpha:1.0];
		
        self.hb_appearanceSettings = appearanceSettings;
		
        self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring:)];
        self.respringButton.tintColor = [UIColor colorWithRed:69/255.0 green:13/255.0 blue:89/255.0 alpha:1.0];
        self.navigationItem.rightBarButtonItem = self.respringButton;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)respring:(id)sender
{
	UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
	while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed)
	{
		view = view.presentedViewController;
	}
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Confirmation" message:@"Do you want to respring?" preferredStyle:UIAlertControllerStyleAlert];
	[alertController addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
	NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [t launch];                                                    
    }]];
    [view presentViewController:alertController animated:YES completion:nil];
}

-(void)showExplanation:(UIAlertController *)expController
{
	expController = [UIAlertController alertControllerWithTitle:@"@@FULLPROJECTNAME@@" message:@"Alert message" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
	UIAlertAction *installAction = [UIAlertAction actionWithTitle:@"Install Activator" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://url/https://cydia.saurik.com/package/libactivator/"] options:@{} completionHandler:nil];
	}];

	[expController addAction: installAction];
	[expController addAction:alertAction];
	[self presentViewController:expController animated:YES completion:nil];
}


@end
