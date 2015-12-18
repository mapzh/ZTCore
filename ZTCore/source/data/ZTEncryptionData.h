//
//  NSData+BisData.h
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonHMAC.h>
@interface NSData (EncryptionData)
#pragma mark - 转换字符串API
/*!
 *  将二进制转换成字符串
 *
 *  @return 字符串
 */
- (NSString *)toString;

#pragma mark - 加密相关API
/*!
 *  将string文本转换成base64二进制
 *
 *  @return base64二进制
 */
+ (NSData *)base64DataFromString:(NSString *)string;

/**
 * MD加密算法
 */
- (NSData *)MD2;
- (NSData *)MD4;
- (NSData *)MD5;

/**
 * SHA加密算法
 */
- (NSData *)SHA1;
- (NSData *)SHA224;
- (NSData *)SHA256;
- (NSData *)SHA384;
- (NSData *)SHA512;

/**
 * AES256加密与解密
 */
- (NSData *)AES256EncryptedUsingKey:(id)key error:(NSError **)error;
- (NSData *)AES256DecryptedUsingKey:(id)key error:(NSError **)error;

/**
 * DES加密与解密
 */
- (NSData *)DESEncryptedUsingKey:(id)key error:(NSError **)error;
- (NSData *)DESDecryptedUsingKey:(id)key error:(NSError **)error;

/**
 * CAST加密与解密
 */
- (NSData *)CASTEncryptedUsingKey:(id)key error:(NSError **)error;
- (NSData *)CASTDecryptedUsingKey:(id)key error:(NSError **)error;

/**
 * 弱加密算法
 */
- (NSData *)dataEncryptedUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                      error:(CCCryptorStatus *)error;
- (NSData *)dataEncryptedUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                    options:(CCOptions) options
                                      error:(CCCryptorStatus *) error;
- (NSData *)dataEncryptedUsingAlgorithm:(CCAlgorithm) algorithm
                                        key:(id)key		// data or string
                       initializationVector:(id)iv		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error;

- (NSData *)decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                      error:(CCCryptorStatus *)error;
- (NSData *)decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error;
- (NSData *)decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                       initializationVector:(id)iv		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error;
@end
