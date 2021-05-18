#import "Tweak.h"

HBPreferences *preferences;

BOOL enabled = NO;

%group Tweak

%hook ExampleClass
-(void)exampleMethod:(id)arg1
{
%orig;
}
%end

%end

%ctor {

preferences = [[HBPreferences alloc] initWithIdentifier:@"@@PACKAGENAME@@"];
[preferences registerBool:&enabled default:YES forKey:@"kEnabled"];

if(enabled) %init(Tweak);

}
