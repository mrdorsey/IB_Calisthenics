//
//  AppDelegate.m
//  IB calisthenics
//
//  Created by Michael Dorsey on 10/7/12.
//  Copyright (c) 2012 Michael Dorsey. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}

// Copy Text Action Impls
- (IBAction)showHelloText:(id)sender {
	[[self cpOutputLbl] setStringValue: @"Hello"];
}

- (IBAction)showGoodbyeText:(id)sender {
	[[self cpOutputLbl] setStringValue: @"Goodbye"];
}

- (IBAction)copyUserText:(id)sender {
	[[self cpOutputLbl] setStringValue:[
		[self cpInputTxt] stringValue]
	];
}

// Show Garish Num Action Impls
- (IBAction)showGarishNumberText:(id)sender {
	NSInteger selectedSegment = [sender selectedSegment];
	NSString *selectedLabel = [sender labelForSegment:[[self garishNumCtrl] selectedSegment]];
	
	NSString *lblString = [NSString stringWithFormat:@"%ld%@%@",
						   selectedSegment, @": ", selectedLabel];
	[[self garishTxtLbl] setStringValue: lblString];
}

// Season Action Impls
- (IBAction)showSeasonText:(id)sender {
	NSInteger selectedSeason = [sender selectedRow];
	NSString *seasonLabel;
	
	switch(selectedSeason) {
		case 0: seasonLabel = @"December";
			break;
		case 1: seasonLabel = @"March";
			break;
		case 2: seasonLabel = @"June";
			break;
		case 3: seasonLabel = @"September";
			break;
	}
	
	[[self seasonOutputLbl] setStringValue: seasonLabel];
}

// Current Time Action Impls
- (IBAction)showTimeNow:(id)sender {
	NSDate *now = [NSDate date];
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:@"MM/dd/yy hh:mm:ss a"];
	[[self timeNowLbl] setStringValue:[outputFormatter stringFromDate: now]];
}

// Square Slider Action Impls
- (IBAction)showSliderValSquared:(id)sender {
	double sliderVal = [[self squareSlider] floatValue];
	double sliderSquared = pow(sliderVal, 2);
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle: NSNumberFormatterSpellOutStyle];
	
	[[self sliderValLbl] setDoubleValue: sliderVal];
	[[self squareValLbl] setStringValue: [formatter stringFromNumber: [NSNumber numberWithDouble: sliderSquared]]];
}

// Speech Action Impls
- (IBAction)changeVoiceType:(id)sender {
	bool wasSpeaking = false;
	if([[self synth] isSpeaking]) {
		wasSpeaking = true;
	}
	
	[[self synth] setVoice: [@"com.apple.speech.synthesis.voice." stringByAppendingString: [sender labelForSegment:[sender selectedSegment]]]];
	[[self voiceSpeedSlider] setFloatValue:[[self synth] rate]];
	
	if(wasSpeaking) {
		[[self synth] startSpeakingString: [[self voiceText] stringValue]];
	}
}

- (IBAction)changeVoiceSpeed:(id)sender {
	[[self synth] setRate: [sender floatValue]];
}

- (IBAction)startSpeech:(id)sender {
	[[self synth] startSpeakingString: [[self voiceText] stringValue]];
}

- (IBAction)stopSpeech:(id)sender {
	[[self synth] stopSpeaking];
}
@end
