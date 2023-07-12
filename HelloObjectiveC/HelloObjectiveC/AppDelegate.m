//
//  AppDelegate.m
//  HelloObjectiveC
//
//  Created by 이승준 on 2023/07/12.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    NSSpeechSynthesizer *speechSynth;
}

@property (strong) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextFieldCell *textField;

- (IBAction)sayHelloButton:(id)sender;

@property (weak) IBOutlet NSTextFieldCell *textLabel;


@end



@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    
    speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice: nil];
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)sayHelloButton:(id)sender {
    // var message: String = textField...
    
    // 참조 타입의 변수를 생성할 때
    // 포인터를 나타내는 *을 앞에 붙여 만든다.
    NSString *name = [self.textField stringValue];
    
    NSString *message =[[NSString alloc] initWithFormat:@"Hello %@", name];
    
    NSLog(@"%@", message);
    
    [self.textLabel setStringValue:message];
    
    [speechSynth startSpeakingString:message];
}
@end
