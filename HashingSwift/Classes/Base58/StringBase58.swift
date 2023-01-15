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
import Base58Swift

/// Base58 String decoder
public struct StringBase58 {
    private let string: String
    
    public init(string: String) {
        self.string = string
    }
    
    /// Decodes String using Base58
    /// - Returns: A decoded data based on Base58
    public func decode() -> Data {
        guard let decodedValue = Base58.base58Decode(string) else {
            return Data()
        }
        
        return Data(decodedValue)
    }
}

extension String {
    /// A point of access to Base58 functionality for String
    public var base58: StringBase58 {
        .init(string: self)
    }
}
