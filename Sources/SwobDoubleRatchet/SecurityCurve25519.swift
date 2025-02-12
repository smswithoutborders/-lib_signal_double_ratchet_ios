//
//  SecurityCurve25519.swift
//  SMSWithoutBorders-Production
//
//  Created by sh3rlock on 27/06/2024.
//

import CryptoKit
import Foundation

/// An error we can throw when something goes wrong.
public class SecurityCurve25519 {
    enum Exceptions: Error {
        case DuplicateKeys
        case FailedToStoreItem
        case FailedToCreateSecKey
        case KeychainFailedToRead
    }

    public static func generateKeyPair(keystoreAlias: String? = nil) throws ->
    Curve25519.KeyAgreement.PrivateKey {
        // After careful consideration - this function is useless
        return Curve25519.KeyAgreement.PrivateKey()
    }
    
     public static func calculateSharedSecret( privateKey: Curve25519.KeyAgreement.PrivateKey,
                                              publicKey: Curve25519.KeyAgreement.PublicKey) throws -> SymmetricKey {
        do {
            let sharedSecret = try privateKey.sharedSecretFromKeyAgreement(with: publicKey)
            return sharedSecret.hkdfDerivedSymmetricKey(
                using: SHA256.self,
                salt: Data(),
                sharedInfo: "x25591_key_exchange".data(using: .utf8)!,
                outputByteCount: 32)
        } catch {
            throw error
        }
    }
    
}
