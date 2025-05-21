#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

// ViewController
@interface _TtC10Calculator21DisplayViewController : NSObject
{
    int maximumResultDigits;
}
- (void)loadView;
@end

// DisplayView
@interface _TtC10Calculator11DisplayView : NSObject
{
    int maximumResultDigits;
}
- (void)layoutSubviews;
@end

// Controller
@interface _TtC10Calculator20CalculatorController : NSObject
{
	int maxLandscapeDigits;
}
- (void)viewDidLoad;
@end

// Model
@interface _TtC10Calculator15CalculatorModel : NSObject
{ 
	int maximumDigitCount;
}
- (void)buttonPressed:(long long)arg1;
@end

// NumberFormatter
@interface _TtC10Calculator25CalculatorNumberFormatter : NSObject
{
    int maximumDigitCount;
}
- (id)stringFromNumber:(id)arg1;
@end


// ViewController
%hook _TtC10Calculator21DisplayViewController
- (void)loadView {
	%orig;
	MSHookIvar<int>(self, "maximumResultDigits") = 100;
	return;
}

%end


//DisplayView
%hook _TtC10Calculator11DisplayView
- (void)layoutSubviews {
	%orig;
	MSHookIvar<int>(self, "maximumResultDigits") = 100;
	return;
}

%end


// Controller
%hook _TtC10Calculator20CalculatorController
- (void)viewDidLoad {
	%orig;
	MSHookIvar<int>(self, "maxLandscapeDigits") = 100;
	return;
}

%end


// Model
%hook _TtC10Calculator15CalculatorModel
- (id)buttonPressed:(long long)arg1 {
	MSHookIvar<int>(self, "maximumDigitCount") = 100; 
	id ret = %orig;
	// probably allow input of "endless" amount of digits
	AudioServicesPlaySystemSound(1519);

	return ret;
}

%end


// NumberFormatter
%hook _TtC10Calculator25CalculatorNumberFormatter
- (id)stringFromNumber:(id)arg1 {
	MSHookIvar<int>(self, "maximumDigitCount") = 100; 
	// result of operation printing "endless" amount of digits
	id ret = %orig;
	return ret;
}

%end


// ...
%ctor {
	NSLog(@"[CH] === Hello from CalcHaptics ===");
	NSLog(@"[CH] By @ghh-jb (untether)");

}
