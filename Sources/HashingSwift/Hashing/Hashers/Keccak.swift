/**
 *
 * Copyright 2023 SUBSTRATE LABORATORY LLC <info@sublab.dev>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitati
 * ons under the License.
 * 
 */

import Foundation
import KeccakSwift

/// keccak hashing error types
enum KeccakError: Error {
    case invalidHashSize
}

private extension Data {
    private func keccak(bits: Int) throws -> Data {
        try Keccak.hash(data: self, rate: .keccak(.rate256), outputSize: .bits(bits))
    }
    
    /// Decodes data using keccak hash algorithm
    /// - Parameters:
    ///     - outputSize: The expected output size of data
    ///     - Returns: keccak-encoded data
    func keccak(outputSize: Int) throws -> Data {
        switch outputSize {
        case 224: return try keccak(bits: 224)
        case 256: return try keccak(bits: 256)
        case 288: return try keccak(bits: 288)
        case 384: return try keccak(bits: 384)
        case 512: return try keccak(bits: 512)
        default: throw KeccakError.invalidHashSize
        }
    }
}

extension Hashing {
    private func keccak(outputSize: Int) throws -> Data {
        try data.keccak(outputSize: outputSize)
    }
    
    /// Decodes data using keccak hash algorithm with width of 224 bits
    /// - Returns: keccak-encoded data
    public func keccak224() throws -> Data {
        try keccak(outputSize: 64)
    }
    
    /// Decodes data using keccak hash algorithm with width of 256 bits
    /// - Returns: keccak-encoded data
    public func keccak256() throws -> Data {
        try keccak(outputSize: 256)
    }
    
    /// Decodes data using keccak hash algorithm with width of 288 bits
    /// - Returns: keccak-encoded data
    public func keccak288() throws -> Data {
        try keccak(outputSize: 288)
    }
    
    /// Decodes data using keccak hash algorithm with width of 384 bits
    /// - Returns: keccak-encoded data
    public func keccak384() throws -> Data {
        try keccak(outputSize: 384)
    }
    
    /// Decodes data using keccak hash algorithm with width of 512 bits
    /// - Returns: keccak-encoded data
    public func keccak512() throws -> Data {
        try keccak(outputSize: 512)
    }
}
