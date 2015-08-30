//
//  RNCheckFileExists.m
//  RNCheckFileExists
//
//  Created by Ross Haker on 8/30/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RNCheckFileExists.h"

@implementation RNCheckFileExists

// Expose this module to the React Native bridge
RCT_EXPORT_MODULE()

// Persist data
RCT_EXPORT_METHOD(checkFile:(NSString *)fileName
                  errorCallback:(RCTResponseSenderBlock)failureCallback
                  callback:(RCTResponseSenderBlock)successCallback) {
    
    // Validate the file name has positive length
    if ([fileName length] < 1) {
        
        // Show failure message
        NSDictionary *resultsDict = @{
                                      @"success" : @NO,
                                      @"errMsg"  : @"Your file does not have a name."
                                      };
        
        // Execute the JavaScript failure callback handler
        failureCallback(@[resultsDict]);
        return;
        
    }
    
    // Validate the file name has an extension
    NSRange isRange = [fileName rangeOfString:@"." options:NSCaseInsensitiveSearch];
    
    if(isRange.location == 0) {
        
        // Show failure message for hidden files
        NSDictionary *resultsDict = @{
                                      @"success" : @NO,
                                      @"errMsg"  : @"Your file does not have a valid extension."
                                      };
        
        // Execute the JavaScript failure callback handler
        failureCallback(@[resultsDict]);
        return;
        
    } else {
        
        NSRange isSpacedRange = [fileName rangeOfString:@"." options:NSCaseInsensitiveSearch];
        if(isSpacedRange.location != NSNotFound) {
            // valid extension
        } else {
            
            // Show failure message for invalid extension
            NSDictionary *resultsDict = @{
                                          @"success" : @NO,
                                          @"errMsg"  : @"Your file does not have a valid extension."
                                          };
            
            // Execute the JavaScript failure callback handler
            failureCallback(@[resultsDict]);
            return;
            
        }
    }
    
    // Initialize FileManager to handle pathLookup
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *pathForFile;
    
    // Create an array of directory Paths to get the documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // The documents directory is the first item
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    pathForFile = [NSString stringWithFormat:@"%@/%@", documentsDirectory, fileName];
    NSLog(@"Writing to %@", pathForFile);
    
    // Check if file exists
    if ([fileManager fileExistsAtPath:pathForFile]){
        
        // Show success message as file exists
        NSDictionary *resultsDict = @{
                                      @"success" : @YES,
                                      @"successMsg"  : @"yes"
                                      };
        
        // Call the JavaScript sucess handler
        successCallback(@[resultsDict]);
        return;
        
    } else {
        
        // Show success message as file does not exist
        NSDictionary *resultsDict = @{
                                      @"success" : @YES,
                                      @"successMsg"  : @"no"
                                      };
        
        // Call the JavaScript sucess handler
        successCallback(@[resultsDict]);
        return;
        
    }
    
}

@end

