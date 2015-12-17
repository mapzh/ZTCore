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
@interface NSData (BisData)
#pragma mark - 转换字符串API
/*!
 *  将二进制转换成字符串
 *
 *  @return 字符串
 */
- (NSString *)bis_toString;

#pragma mark - 加密相关API
/*!
 *  将string文本转换成base64二进制
 *
 *  @return base64二进制
 */
+ (NSData *)bis_base64DataFromString:(NSString *)string;

/**
 * MD加密算法
 */
- (NSData *)bis_MD2;
- (NSData *)bis_MD4;
- (NSData *)bis_MD5;

/**
 * SHA加密算法
 */
- (NSData *)bis_SHA1;
- (NSData *)bis_SHA224;
- (NSData *)bis_SHA256;
- (NSData *)bis_SHA384;
- (NSData *)bis_SHA512;

/**
 * AES256加密与解密
 */
- (NSData *)bis_AES256EncryptedUsingKey:(id)key error:(NSError **)error;
- (NSData *)bis_AES256DecryptedUsingKey:(id)key error:(NSError **)error;

/**
 * DES加密与解密
 */
- (NSData *)bis_DESEncryptedUsingKey:(id)key error:(NSError **)error;
- (NSData *)bis_DESDecryptedUsingKey:(id)key error:(NSError **)error;

/**
 * CAST加密与解密
 */
- (NSData *)bis_CASTEncryptedUsingKey:(id)key error:(NSError **)error;
- (NSData *)bis_CASTDecryptedUsingKey:(id)key error:(NSError **)error;

/**
 * 弱加密算法
 */
- (NSData *)bis_dataEncryptedUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                      error:(CCCryptorStatus *)error;
- (NSData *)bis_dataEncryptedUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                    options:(CCOptions) options
                                      error:(CCCryptorStatus *) error;
- (NSData *)bis_dataEncryptedUsingAlgorithm:(CCAlgorithm) algorithm
                                        key:(id)key		// data or string
                       initializationVector:(id)iv		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error;

- (NSData *)bis_decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                      error:(CCCryptorStatus *)error;
- (NSData *)bis_decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error;
- (NSData *)bis_decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                        key:(id)key		// data or string
                       initializationVector:(id)iv		// data or string
                                    options:(CCOptions)options
                                      error:(CCCryptorStatus *)error;
@end
