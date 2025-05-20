#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

// KeypadView
@interface _TtC10Calculator20CalculatorKeypadView :NSObject
{
	// none
}
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
@end

// Model
@interface _TtC10Calculator15CalculatorModel : NSObject
{ 
	int maximumDigitCount;

}
- (void)buttonPressed:(long long)arg1;
@end

// NumberFormatter
@interface _TtC10Calculator25CalculatorNumberFormatter
{
    int maximumDigitCount;
}
- (id)stringFromNumber:(id)arg1;
@end


// KeypadView
%hook _TtC10Calculator20CalculatorKeypadView
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2 {
	AudioServicesPlaySystemSound(1519);
	%orig;
	return;
}
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2 {
	AudioServicesPlaySystemSound(1519);
	%orig;
	return;
}

%end


// Model
%hook _TtC10Calculator15CalculatorModel
- (id)buttonPressed:(long long)arg1 {
	id ret = %orig;
	MSHookIvar<int>(self, "maximumDigitCount") = 100; 
	// probably allow input of "endless" amount of digits
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
