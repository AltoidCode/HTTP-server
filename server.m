#import <Cocoa/Cocoa.h>

@interface MyHTTPServer : NSObject <NSURLConnectionDelegate>
@end

@implementation MyHTTPServer
- (void)startServer {
    NSApplication *app = [NSApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserverForName:NSApplicationWillTerminateNotification object:nil queue:nil usingBlock:^(NSNotification *note){
        [app stop:nil];
    }];
    [app run];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyHTTPServer *server = [[MyHTTPServer alloc] init];
        [server startServer];
    }
    return 0;
}
