//
//  NSData+BisData.m
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import "NSData+BisData.h"

@implementation NSData (BisData)
- (NSData *)hdf_MD2 {
    unsigned char hash[CC_MD2_DIGEST_LENGTH];
    (void) CC_MD2( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_MD2_DIGEST_LENGTH] );
}

- (NSData *)hdf_MD4 {
    unsigned char hash[CC_MD4_DIGEST_LENGTH];
    (void) CC_MD4( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_MD4_DIGEST_LENGTH] );
}

- (NSData *)hdf_MD5 {
    unsigned char hash[CC_MD5_DIGEST_LENGTH];
    (void) CC_MD5( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_MD5_DIGEST_LENGTH] );
}

- (NSData *)hdf_SHA1 {
    unsigned char hash[CC_SHA1_DIGEST_LENGTH];
    (void) CC_SHA1( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_SHA1_DIGEST_LENGTH] );
}

- (NSData *)hdf_SHA224 {
    unsigned char hash[CC_SHA224_DIGEST_LENGTH];
    (void) CC_SHA224( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_SHA224_DIGEST_LENGTH] );
}

- (NSData *)hdf_SHA256 {
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    (void) CC_SHA256( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_SHA256_DIGEST_LENGTH] );
}

- (NSData *)hdf_SHA384 {
    unsigned char hash[CC_SHA384_DIGEST_LENGTH];
    (void) CC_SHA384( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_SHA384_DIGEST_LENGTH] );
}

- (NSData *)hdf_SHA512 {
    unsigned char hash[CC_SHA512_DIGEST_LENGTH];
    (void) CC_SHA512( [self bytes], (CC_LONG)[self length], hash );
    
    return ( [NSData dataWithBytes: hash length: CC_SHA512_DIGEST_LENGTH] );
}

- (NSData *)hdf_AES256EncryptedUsingKey:(id)key error:(NSError **)error {
    CCCryptorStatus status = kCCSuccess;
    NSData * result = [self hdf_dataEncryptedUsingAlgorithm: kCCAlgorithmAES128
                                                        key: key
                                                    options: kCCOptionPKCS7Padding
                                                      error: &status];
    
    if ( result != nil )
        return ( result );
    
    if ( error != NULL )
        *error = [self errorWithCCCryptorStatus: status];
    
    return ( nil );
}

- (NSData *)hdf_AES256DecryptedUsingKey:(id)key error:(NSError **)error {
    CCCryptorStatus status = kCCSuccess;
    NSData * result = [self hdf_decryptedDataUsingAlgorithm: kCCAlgorithmAES128
                                                        key: key
                                                    options: kCCOptionPKCS7Padding
                                                      error: &status];
    
    if ( result != nil )
        return ( result );
    
    if ( error != NULL )
        *error = [self errorWithCCCryptorStatus: status];
    
    return ( nil );
}

- (NSData *)hdf_DESEncryptedUsingKey:(id)key error:(NSError **)error {
    CCCryptorStatus status = kCCSuccess;
    NSData * result = [self hdf_dataEncryptedUsingAlgorithm: kCCAlgorithmDES
                                                        key: key
                                                    options: kCCOptionPKCS7Padding
                                                      error: &status];
    
    if ( result != nil )
        return ( result );
    
    if ( error != NULL )
        *error = [self errorWithCCCryptorStatus: status];
    
    return ( nil );
}

- (NSData *)hdf_DESDecryptedUsingKey:(id)key error:(NSError **)error {
    CCCryptorStatus status = kCCSuccess;
    NSData * result = [self hdf_decryptedDataUsingAlgorithm: kCCAlgorithmDES
                                                        key: key
                                                    options: kCCOptionPKCS7Padding
                                                      error: &status];
    
    if ( result != nil )
        return ( result );
    
    if ( error != NULL )
        *error = [self errorWithCCCryptorStatus: status];
    
    return ( nil );
}

- (NSData *)hdf_CASTEncryptedUsingKey:(id)key error:(NSError **)error {
    CCCryptorStatus status = kCCSuccess;
    NSData * result = [self hdf_dataEncryptedUsingAlgorithm: kCCAlgorithmCAST
                                                        key: key
                                                    options: kCCOptionPKCS7Padding
                                                      error: &status];
    
    if ( result != nil )
        return ( result );
    
    if ( error != NULL )
        *error = [self errorWithCCCryptorStatus: status];
    
    return ( nil );
}

- (NSData *)hdf_CASTDecryptedUsingKey:(id)key error:(NSError **)error {
    CCCryptorStatus status = kCCSuccess;
    NSData * result = [self hdf_decryptedDataUsingAlgorithm: kCCAlgorithmCAST
                                                        key: key
                                                    options: kCCOptionPKCS7Padding
                                                      error: &status];
    
    if ( result != nil )
        return ( result );
    
    if ( error != NULL )
        *error = [self errorWithCCCryptorStatus: status];
    
    return ( nil );
}

- (NSData *)hdf_dataEncryptedUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                      error:(CCCryptorStatus *)error {
    return ( [self hdf_dataEncryptedUsingAlgorithm: algorithm
                                               key: key
                              initializationVector: nil
                                           options: 0
                                             error: error] );
}

- (NSData *)hdf_dataEncryptedUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                    options:(CCOptions) options
                                      error:(CCCryptorStatus *) error {
    return ( [self hdf_dataEncryptedUsingAlgorithm: algorithm
                                               key: key
                              initializationVector: nil
                                           options: options
                                             error: error] );
}


static void FixKeyLengths( CCAlgorithm algorithm, NSMutableData * keyData, NSMutableData * ivData ) {
    NSUInteger keyLength = [keyData length];
    switch ( algorithm )
    {
        case kCCAlgorithmAES128:
        {
            if ( keyLength < 16 )
            {
                [keyData setLength: 16];
            }
            else if ( keyLength < 24 )
            {
                [keyData setLength: 24];
            }
            else
            {
                [keyData setLength: 32];
            }
            
            break;
        }
            
        case kCCAlgorithmDES:
        {
            [keyData setLength: 8];
            break;
        }
            
        case kCCAlgorithm3DES:
        {
            [keyData setLength: 24];
            break;
        }
            
        case kCCAlgorithmCAST:
        {
            if ( keyLength < 5 )
            {
                [keyData setLength: 5];
            }
            else if ( keyLength > 16 )
            {
                [keyData setLength: 16];
            }
            
            break;
        }
            
        case kCCAlgorithmRC4:
        {
            if ( keyLength > 512 )
                [keyData setLength: 512];
            break;
        }
            
        default:
            break;
    }
    
    [ivData setLength: [keyData length]];
}

- (NSData *)hdf_dataEncryptedUsingAlgorithm:(CCAlgorithm) algorithm
                                        key:(id)key		// data or string
                       initializationVector:(id)iv		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error {
    CCCryptorRef cryptor = NULL;
    CCCryptorStatus status = kCCSuccess;
    
    NSParameterAssert([key isKindOfClass: [NSData class]] || [key isKindOfClass: [NSString class]]);
    NSParameterAssert(iv == nil || [iv isKindOfClass: [NSData class]] || [iv isKindOfClass: [NSString class]]);
    
    NSMutableData * keyData, * ivData;
    if ( [key isKindOfClass: [NSData class]] )
        keyData = (NSMutableData *) [key mutableCopy];
    else
        keyData = [[key dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    
    if ( [iv isKindOfClass: [NSString class]] )
        ivData = [[iv dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    else
        ivData = (NSMutableData *) [iv mutableCopy];	// data or nil
    
    // ensure correct lengths for key and iv data, based on algorithms
    FixKeyLengths( algorithm, keyData, ivData );
    
    status = CCCryptorCreate( kCCEncrypt, algorithm, options,
                             [keyData bytes], [keyData length], [ivData bytes],
                             &cryptor );
    
    if ( status != kCCSuccess )
    {
        if ( error != NULL )
            *error = status;
        return ( nil );
    }
    
    NSData * result = [self _runCryptor: cryptor result: &status];
    if ( (result == nil) && (error != NULL) )
        *error = status;
    
    CCCryptorRelease( cryptor );
    
    return ( result );
}

- (NSData *)hdf_decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                      error:(CCCryptorStatus *)error {
    return ( [self hdf_decryptedDataUsingAlgorithm: algorithm
                                               key: key
                              initializationVector: nil
                                           options: 0
                                             error: error] );}

- (NSData *)hdf_decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error {
    return ( [self hdf_decryptedDataUsingAlgorithm: algorithm
                                               key: key
                              initializationVector: nil
                                           options: options
                                             error: error] );
}

- (NSData *)hdf_decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                       initializationVector:(id)iv		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error {
    CCCryptorRef cryptor = NULL;
    CCCryptorStatus status = kCCSuccess;
    
    NSParameterAssert([key isKindOfClass: [NSData class]] || [key isKindOfClass: [NSString class]]);
    NSParameterAssert(iv == nil || [iv isKindOfClass: [NSData class]] || [iv isKindOfClass: [NSString class]]);
    
    NSMutableData * keyData, * ivData;
    if ( [key isKindOfClass: [NSData class]] )
        keyData = (NSMutableData *) [key mutableCopy];
    else
        keyData = [[key dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    
    if ( [iv isKindOfClass: [NSString class]] )
        ivData = [[iv dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    else
        ivData = (NSMutableData *) [iv mutableCopy];	// data or nil
    
    // ensure correct lengths for key and iv data, based on algorithms
    FixKeyLengths( algorithm, keyData, ivData );
    
    status = CCCryptorCreate( kCCDecrypt, algorithm, options,
                             [keyData bytes], [keyData length], [ivData bytes],
                             &cryptor );
    
    if ( status != kCCSuccess ) {
        if ( error != NULL )
            *error = status;
        return ( nil );
    }
    
    NSData * result = [self _runCryptor: cryptor result: &status];
    if ( (result == nil) && (error != NULL) )
        *error = status;
    
    CCCryptorRelease( cryptor );
    
    return ( result );
}

- (NSString *)hdf_toString {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

+ (NSData *)hdf_base64DataFromString:(NSString *)string {
    unsigned long ixtext, lentext;
    unsigned char ch, inbuf[4], outbuf[3];
    short i, ixinbuf;
    Boolean flignore, flendtext = false;
    const unsigned char *tempcstring;
    NSMutableData *theData;
    
    if (string == nil) {
        return [NSData data];
    }
    
    ixtext = 0;
    
    tempcstring = (const unsigned char *)[string UTF8String];
    
    lentext = [string length];
    
    theData = [NSMutableData dataWithCapacity: lentext];
    
    ixinbuf = 0;
    
    while (true) {
        if (ixtext >= lentext) {
            break;
        }
        
        ch = tempcstring [ixtext++];
        
        flignore = false;
        
        if ((ch >= 'A') && (ch <= 'Z')) {
            ch = ch - 'A';
        }
        else if ((ch >= 'a') && (ch <= 'z')) {
            ch = ch - 'a' + 26;
        }
        else if ((ch >= '0') && (ch <= '9')) {
            ch = ch - '0' + 52;
        }
        else if (ch == '+') {
            ch = 62;
        }
        else if (ch == '=') {
            flendtext = true;
        }
        else if (ch == '/') {
            ch = 63;
        }
        else {
            flignore = true;
        }
        
        if (!flignore) {
            short ctcharsinbuf = 3;
            Boolean flbreak = false;
            
            if (flendtext) {
                if (ixinbuf == 0) {
                    break;
                }
                
                if ((ixinbuf == 1) || (ixinbuf == 2)) {
                    ctcharsinbuf = 1;
                }
                else {
                    ctcharsinbuf = 2;
                }
                
                ixinbuf = 3;
                
                flbreak = true;
            }
            
            inbuf [ixinbuf++] = ch;
            
            if (ixinbuf == 4) {
                ixinbuf = 0;
                
                outbuf[0] = (inbuf[0] << 2) | ((inbuf[1] & 0x30) >> 4);
                outbuf[1] = ((inbuf[1] & 0x0F) << 4) | ((inbuf[2] & 0x3C) >> 2);
                outbuf[2] = ((inbuf[2] & 0x03) << 6) | (inbuf[3] & 0x3F);
                
                for (i = 0; i < ctcharsinbuf; i++) {
                    [theData appendBytes: &outbuf[i] length: 1];
                }
            }
            
            if (flbreak) {
                break;
            }
        }
    }
    
    return theData;
}

#pragma mark - Private
- (NSData *)_runCryptor:(CCCryptorRef)cryptor result:(CCCryptorStatus *)status {
    size_t bufsize = CCCryptorGetOutputLength( cryptor, (size_t)[self length], true );
    void * buf = malloc( bufsize );
    size_t bufused = 0;
    size_t bytesTotal = 0;
    *status = CCCryptorUpdate( cryptor, [self bytes], (size_t)[self length],
                              buf, bufsize, &bufused );
    if ( *status != kCCSuccess ) {
        free( buf );
        return ( nil );
    }
    
    bytesTotal += bufused;
    
    // From Brent Royal-Gordon (Twitter: architechies):
    //  Need to update buf ptr past used bytes when calling CCCryptorFinal()
    *status = CCCryptorFinal( cryptor, buf + bufused, bufsize - bufused, &bufused );
    if ( *status != kCCSuccess )
    {
        free( buf );
        return ( nil );
    }
    
    bytesTotal += bufused;
    
    return ( [NSData dataWithBytesNoCopy: buf length: bytesTotal] );
}

/**
 * 根据加密算法状态，生成错误对象
 */
- (NSError *)errorWithCCCryptorStatus:(CCCryptorStatus)status {
    NSString *description = nil;
    NSString *reason = nil;
    
    switch (status){
        case kCCSuccess:
            description = NSLocalizedString(@"Success", @"Error description");
            break;
            
        case kCCParamError:
            description = NSLocalizedString(@"Parameter Error", @"Error description");
            reason = NSLocalizedString(@"Illegal parameter supplied to encryption/decryption algorithm", @"Error reason");
            break;
            
        case kCCBufferTooSmall:
            description = NSLocalizedString(@"Buffer Too Small", @"Error description");
            reason = NSLocalizedString(@"Insufficient buffer provided for specified operation", @"Error reason");
            break;
            
        case kCCMemoryFailure:
            description = NSLocalizedString(@"Memory Failure", @"Error description");
            reason = NSLocalizedString(@"Failed to allocate memory", @"Error reason");
            break;
            
        case kCCAlignmentError:
            description = NSLocalizedString(@"Alignment Error", @"Error description");
            reason = NSLocalizedString(@"Input size to encryption algorithm was not aligned correctly", @"Error reason");
            break;
            
        case kCCDecodeError:
            description = NSLocalizedString(@"Decode Error", @"Error description");
            reason = NSLocalizedString(@"Input data did not decode or decrypt correctly", @"Error reason");
            break;
            
        case kCCUnimplemented:
            description = NSLocalizedString(@"Unimplemented Function", @"Error description");
            reason = NSLocalizedString(@"Function not implemented for the current algorithm", @"Error reason");
            break;
            
        default:
            description = NSLocalizedString(@"Unknown Error", @"Error description");
            break;
    }
    
    NSMutableDictionary * userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject: description forKey: NSLocalizedDescriptionKey];
    
    if ( reason != nil )
        [userInfo setObject: reason forKey: NSLocalizedFailureReasonErrorKey];
    
    NSError *result = [NSError errorWithDomain:@"CommonCryptoErrorDomain"
                                          code:status
                                      userInfo:userInfo];
    
    return result;
}
@end
