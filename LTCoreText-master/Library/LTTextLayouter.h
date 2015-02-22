//
//  LTTextLayouter.h
//  LTCoreText
//
//  Created by Yusuke Ito on 2011/07/07.
//  Copyright 2011-12 Yusuke Ito
//  http://www.opensource.org/licenses/MIT
// 

#import "LTCoreText.h"


NSString* const LTTextLayouterAttributeValueKey;
NSString* const LTTextLayouterAttributeValueRangeKey;
NSString* const LTTextLayouterAttributeValueFrameKey;


// Primitive
@interface LTTextLayouter : NSObject

-(id)initWithAttributedString:(NSAttributedString *)attrString frameSize:(CGSize)size options:(NSDictionary*)options;

@property (nonatomic, retain, readonly) NSAttributedString* attributedString;
@property (nonatomic, readonly) CGSize frameSize;
@property (nonatomic, readonly) NSUInteger pageCount;

@property (nonatomic) NSUInteger columnCount;
@property (nonatomic) BOOL verticalText;
@property (nonatomic, retain) UIColor* backgroundColor;
@property (nonatomic) UIEdgeInsets contentInset;
@property (nonatomic) CGFloat columnSpace;
@property (nonatomic) float justifyThreshold; // 1.0 is no justify
@property (nonatomic) BOOL useHyphenation; // attributedString must be hyphenated with (soft-hyphen, u0x00AD)

- (NSUInteger)columnCountAtPageIndex:(NSUInteger)index;
- (CGRect)columnFrameWithColumn:(NSUInteger)col;

- (NSRange)rangeOfStringAtPageIndex:(NSUInteger)index column:(NSUInteger)col;
- (NSUInteger)pageIndexOfStringIndex:(NSUInteger)index columnIndex:(NSUInteger*)col;

- (void)layoutIfNeeded;

- (NSArray*)attachmentsAtPageIndex:(NSUInteger)index column:(NSUInteger)col;
- (NSArray*)allValueForAttribute:(NSString*)attrKey atPageIndex:(NSUInteger)index column:(NSUInteger)col;


- (void)drawInContext:(CGContextRef)context atPage:(NSUInteger)pageIndex;

@end



