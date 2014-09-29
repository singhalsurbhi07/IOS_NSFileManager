//
//  BookClass.m
//  NSFileManagerProj
//
//  Created by Surbhi on 5/20/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import "BookClass.h"

@interface BookClass ()

@end

@implementation BookClass
+(BookClass*)initWithBook:(NSString *)bookName andauthorName:(NSString *)authorname anddescription:(NSString *)description {
    
    BookClass *book = [[BookClass alloc] init];
    
    book.bookName = [NSString stringWithString:bookName];
    book.authorName= [NSString stringWithString:authorname];
    book.description= [NSString stringWithString:description];
    
    return book;
}

- (void)setbookName:(NSString *)input {
    //[input retain];
   
    self.bookName = input;
}
- (void)setauthorName:(NSNumber *)input {
    self.authorName=input;
}
- (void)setdescription:(NSNumber *)input {
    self.authorName=input;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self setbookName :[aDecoder decodeObjectForKey:@"bookName"]];
        [self setauthorName:[aDecoder decodeObjectForKey:@"authorName"]];
        [self setDescription:[aDecoder decodeObjectForKey:@"description"]];
    }
    return self;
}
                            
                            
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.bookName forKey:@"bookName"];
     [aCoder encodeObject:self.authorName forKey:@"authorName"];
    [aCoder encodeObject:self.description forKey:@"description"];
 }

@end
