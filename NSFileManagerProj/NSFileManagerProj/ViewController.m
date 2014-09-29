//
//  ViewController.m
//  NSFileManagerProj
//
//  Created by Surbhi on 5/20/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import "ViewController.h"
#import "BookClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)textFieldReturn:(id)sender{
    [self resignFirstResponder];
}

-(IBAction)saveWithFileManager:(id)sender{
    NSString *resultLine=[NSString stringWithFormat:@"%@, %@, %@ \n",self.bookName.text,self.authorName.text,self.des.text];
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSLog(@"doc path=%@",docPath);
    NSString *filePath=[docPath stringByAppendingPathComponent:@"BooksDataFile.csv"];
    NSFileManager *manager;
    manager=[NSFileManager defaultManager];
    if(![manager fileExistsAtPath:filePath]){
        [manager createFileAtPath:filePath contents:nil attributes:nil];
         }
    NSLog(@"%@",filePath);
    NSFileHandle *handler=[NSFileHandle fileHandleForUpdatingAtPath:filePath];
    [handler seekToEndOfFile];
    [handler writeData:[resultLine dataUsingEncoding:NSUTF8StringEncoding]];
    [handler closeFile];
    NSLog(@"info saved");
    [self retrieveFile];
}

-(IBAction)saveWithFileManagerArchive:(id)sender{
    BookClass *book=[[BookClass alloc]init];
   //book =[[BookClass alloc]initWithBook:self.bookName,self.authorName,self.description];
    book.bookName=self.bookName.text;
    book.authorName=self.authorName.text;
    book.description=self.des.text;
    
    NSString *path = @"~/Documents/data";
    path = [path stringByExpandingTildeInPath];
    
    NSMutableDictionary *rootObject;
    rootObject = [NSMutableDictionary dictionary];

    [rootObject setValue:book forKey:@"book"];
    
    [NSKeyedArchiver archiveRootObject:rootObject toFile:path];
    NSLog(@"info saved");
    [self loadDataFromDisk];
    
}

- (void)loadDataFromDisk {
    NSString *path = @"~/Documents/data";
    path = [path stringByExpandingTildeInPath];
    
    NSMutableDictionary *rootObject;
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if ([rootObject valueForKey:@"book"]) {
        BookClass *retbook = [rootObject valueForKey:@"book"];
        NSString *name=retbook.bookName;
        NSString *author=retbook.authorName;
         NSLog(@"loaded values=%@,%@",name,author);
        
    }
   
}
-(void)retrieveFile{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *filePath=[docPath stringByAppendingPathComponent:@"BooksDataFile.csv"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSFileHandle *handler=[NSFileHandle fileHandleForReadingAtPath:filePath];
        NSString *results=[[NSString alloc]initWithData:[handler availableData] encoding:NSUTF8StringEncoding];
        [handler closeFile];
        NSLog(@"results=%@",results);
    }else{
        NSLog(@"File doesnot exist");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
