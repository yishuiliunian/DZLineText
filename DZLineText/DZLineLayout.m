//
//  DZLineLayout.m
//  DZLineText
//
//  Created by baidu on 15/12/14.
//  Copyright © 2015年 dzpqzb. All rights reserved.
//

#import "DZLineLayout.h"
#import "DZRunRef.h"
@implementation DZLineLayout
- (void) dealloc
{
    if (_lineRef) {
        CFRelease(_lineRef);
    }
}
- (instancetype) initWithSize:(CGSize)size string:(NSAttributedString*)string
{
    self = [super init];
    if (!self) {
        return self;
    }
    _size = size;
    _lineRef = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)string);
    CFArrayRef runRefs = CTLineGetGlyphRuns(_lineRef);
    NSMutableArray* dzRuns = [NSMutableArray new];
    for (int i = 0, max =(int)CFArrayGetCount(runRefs); i < max; i++) {
        CTRunRef run = CFArrayGetValueAtIndex(runRefs, i);
        DZRunRef* dzRun = [[DZRunRef alloc] initWithRunRef:run];
        [dzRuns addObject:dzRun];
    }
    _runs = dzRuns;
    return self;
}

- (void) adjustRuns
{
    CGFloat width = _size.width;
    for (int i = 0; i < self.runs.count; i++) {
        DZRunRef* run = self.runs[i];
    }
}

@end
