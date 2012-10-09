//
//  AppDelegate.h
//  IB calisthenics
//
//  Created by Michael Dorsey on 10/7/12.
//  Copyright (c) 2012 Michael Dorsey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

// Copy Text Actions
- (IBAction)showHelloText:(id)sender;
- (IBAction)showGoodbyeText:(id)sender;
- (IBAction)copyUserText:(id)sender;

// Show Garish Number Actions
- (IBAction)showGarishNumberText:(id)sender;

// Season Actions
- (IBAction)showSeasonText:(id)sender;

// Show Time Now Actions
- (IBAction)showTimeNow:(id)sender;

// Square Number Actions
- (IBAction)showSliderValSquared:(id)sender;

// Speech Control Actions
- (IBAction)changeVoiceType:(id)sender;
- (IBAction)changeVoiceSpeed:(id)sender;
- (IBAction)startSpeech:(id)sender;
- (IBAction)stopSpeech:(id)sender;

// Copy Text Outlets

@property (weak) IBOutlet NSTextField *cpOutputLbl;
@property (weak) IBOutlet NSTextField *cpInputTxt;

// Show Garish Number Outlets

@property (weak) IBOutlet NSSegmentedControl *garishNumCtrl;
@property (weak) IBOutlet NSTextField *garishTxtLbl;

// Season Outlets
@property (weak) IBOutlet NSTextField *seasonOutputLbl;
@property (weak) IBOutlet NSMatrix *seasonRadioGrp;

// Show Time Outlets
@property (weak) IBOutlet NSTextField *timeNowLbl;

// Square Number Outlets
@property (weak) IBOutlet NSSlider *squareSlider;
@property (weak) IBOutlet NSTextField *sliderValLbl;
@property (weak) IBOutlet NSTextField *squareValLbl;

// Speech Control Outlets
@property (weak) IBOutlet NSSegmentedControl *voiceTypeControl;
@property (weak) IBOutlet NSSlider *voiceSpeedSlider;
@property (weak) IBOutlet NSButton *voiceSpeakBtn;
@property (weak) IBOutlet NSButton *voiceShushBtn;
@property (weak) IBOutlet NSTextField *voiceText;
@property (weak) IBOutlet NSSpeechSynthesizer *synth;

@end
