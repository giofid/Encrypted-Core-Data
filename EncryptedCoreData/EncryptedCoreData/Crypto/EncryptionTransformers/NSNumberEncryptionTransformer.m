//
//  NSNumberEncryptionTransformer.m
//  Pods
//
//  Created by Giorgio Fiderio on 31/07/15.
//
//

#import "NSNumberEncryptionTransformer.h"

@implementation NSNumberEncryptionTransformer
+ (Class)transformedValueClass
{
    return [NSString class];
}

- (id)transformedValue:(NSNumber*)number
{
    
//    NSLog(@"------------------------");
//    NSLog(@"Starting Encryption");
//    NSLog(@"Original Attribute: %@",number);
    long long num = number.longLongValue;
    NSData* data = [NSData dataWithBytes:&num length:sizeof(num)];
    NSData* encryptedData = [super transformedValue:data];
//    NSLog(@"Encrypted Attribute: %@", encryptedData);
//    NSLog(@"------------------------");
    return encryptedData;
}

- (id)reverseTransformedValue:(NSData*)data
{
    if (nil == data)return nil;
//    NSLog(@"------------------------");
//    NSLog(@"Starting Decryption");
//    NSLog(@"Encrypted Attribute: %@",data);
    data = [super reverseTransformedValue:data];
    long long number;
    [data getBytes:&number length:sizeof(number)];
    NSNumber * final = [[NSNumber alloc] initWithLongLong:number];
//    NSLog(@"Decrypted Attribute: %@",final);
//    NSLog(@"------------------------");
    return final;
}
@end
