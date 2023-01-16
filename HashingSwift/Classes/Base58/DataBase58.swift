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

/// Base58 Data encoder
public struct DataBase58 {
    private let data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    /// Encodes Data using Base58
    /// - Returns: An encoded String based on Base58
    public func encode() -> String {
        Base58.base58Encode(Array(data))
    }
}

extension Data {
    /// A point of access to Base58 functionality for Data
    public var base58: DataBase58 {
        .init(data: self)
    }
}
