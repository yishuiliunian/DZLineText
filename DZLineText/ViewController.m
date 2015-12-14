//
//  ViewController.m
//  DZLineText
//
//  Created by baidu on 15/12/14.
//  Copyright © 2015年 dzpqzb. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "DZRunRef.h"




@interface DZTextLayout : NSObject
- (instancetype) initWithSize:(CGSize)size;
@end


@interface DZTextLayout ()
{
    CGSize _size;
}
@end

@implementation DZTextLayout

- (instancetype) initWithSize:(CGSize)size
{
    self = [super init];
    if (!self) {
        return self;
    }
    _size = size;
    return self;
}

@end


@interface DZView : UIView

@end

@implementation DZView

- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:@"测试ss"];
    
    UIColor* color = [UIColor redColor];
    [str appendAttributedString:[[NSAttributedString alloc] initWithString:@"哈哈哈" attributes:@{NSForegroundColorAttributeName:color, kDZTextAlignment:@(1)}]];
    [str addAttribute: kDZTextAlignment value:@(DZTextAlignmentRight) range:NSRangeFromString(str.string)];
    CTLineRef line =   CTLineCreateWithAttributedString((__bridge CFAttributedStringRef) str);
    CFArrayRef runRefs = CTLineGetGlyphRuns(line);
    for (int i = 0, max = (int)CFArrayGetCount(runRefs) ; i < max; i++) {
        CTRunRef run = CFArrayGetValueAtIndex(runRefs, i);
        DZRunRef* runRef = [[DZRunRef alloc] initWithRunRef:run];
        NSLog(@"");
    }
}

@end




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSAssert(NO, @"asdfasdfasfasdfasdf");
    
    DZView* view = [DZView new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
