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
import xxHash_Swift
import CommonSwift

private extension Data {
    /// Decodes data using XX hash algorithm
    /// - Parameters:
    ///     - width: The expected width of data
    ///     - Returns: XX-encoded data
    func xx(width: Int64) throws -> Data {
        try (0..<width / 64).compactMap {
            let xxHash64 = XXH64(UInt64($0))
            let _ = xxHash64.update(self)
            let result = try xxHash64.digestHex().hex.decode().reversed()
            return Data(result)
        }
        .reduce(Data()) { $0 + $1 }
    }
}

extension Hashing {
    /// Decodes data using XX hash algorithm with width of 64 bits
    /// - Returns: XX-encoded data
    public func xx64() throws -> Data {
        try data.xx(width: 64)
    }
    
    /// Decodes data using XX hash algorithm with width of 128 bits
    /// - Returns: XX-encoded data
    public func xx128() throws -> Data {
        try data.xx(width: 128)
    }
    
    /// Decodes data using XX hash algorithm with width of 256 bits
    /// - Returns: XX-encoded data
    public func xx256() throws -> Data {
        try data.xx(width: 256)
    }
}
