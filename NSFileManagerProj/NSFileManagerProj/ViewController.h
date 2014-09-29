//
//  ViewController.h
//  NSFileManagerProj
//
//  Created by Surbhi on 5/20/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookClass.h"


@interface ViewController : UIViewController
@property IBOutlet UITextField *bookName;
@property IBOutlet UITextField *authorName;
//@property IBOutlet UITextView *description;
@property IBOutlet UITextField *des;

- (IBAction)saveWithFileManager:(id)sender;
- (IBAction)retrieveFile:(id)sender;

- (IBAction)saveWithFileManagerArchive:(id)sender;


- (IBAction)textFieldReturn:(id)sender;



@end
