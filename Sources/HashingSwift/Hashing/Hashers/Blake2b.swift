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
 * limitations under the License.
 * 
 */

import Foundation
import Blake2

/// Blake hashing error types
enum BlakeError: Error {
    case hashingFailure(String)
}

private extension Data {
    
    /// Hashes the data using blake2b
    /// - Parameters:
    ///     - size: The expected size (in bits) of Data
    ///     - Returns: Blake-hashed Data
    func blake2b(size: Int) throws -> Data {
        do {
            var hasher = try Blake2(.b2b, size: size / 8)
            hasher.update(self)
            
            return try hasher.finalize()
        } catch let error {
            throw BlakeError.hashingFailure(error.localizedDescription)
        }
    }
}

extension Hashing {
    /// Hashes the data using blake2b for 128 bits
    /// - Returns: Blake-hashed Data
    public func blake2b_128() throws -> Data {
        try data.blake2b(size: 128)
    }

    /// Hashes the data using blake2b for 160 bits
    /// - Returns: Blake-hashed Data
    public func blake2b_160() throws -> Data {
        try data.blake2b(size: 160)
    }

    /// Hashes the data using blake2b for 256 bits
    /// - Returns: Blake-hashed Data
    public func blake2b_256() throws -> Data {
        try data.blake2b(size: 256)
    }

    /// Hashes the data using blake2b for 384 bits
    /// - Returns: Blake-hashed Data
    public func blake2b_384() throws -> Data {
        try data.blake2b(size: 384)
    }

    /// Hashes the data using blake2b for 512 bits
    /// - Returns: Blake-hashed Data
    public func blake2b_512() throws -> Data {
        try data.blake2b(size: 512)
    }
}
