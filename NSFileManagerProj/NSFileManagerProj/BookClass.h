//
//  BookClass.h
//  NSFileManagerProj
//
//  Created by Surbhi on 5/20/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookClass : NSObject <NSCoding> {
    NSString *sbookName;
    NSString *authorName;
    NSString *description;
    //(BookClass*) initWithBook:(NSString *)bookName andauthorName:(NSString *)authorname anddescription:(NSString *)description;

    
}

@property (copy) NSString *bookName;
@property (copy) NSString *authorName;
@property (copy) NSString *description;

+(BookClass*) initWithBook:(NSString *)bookName andauthorName:(NSString *)authorname anddescription:(NSString *)description;
- (void)setbookName:(NSString *)input; //string
- (void)setauthorName:(NSNumber *)input; //number
- (void)setdescription:(NSNumber *)input;

@end