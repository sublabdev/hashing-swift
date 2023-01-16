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

/// SS58 constants' holder
struct SS58 {
    /// SS58-related errors
    enum Error: Swift.Error {
        case invalidAddressException
        case invalidChecksumException
        case `internal`
        case noDataException
        case decodingFailure(String)
        case invalidPublicKey
    }
    
    static let networkTypeLengthRange1: ClosedRange<UInt> = 0...63
    static let networkTypeLengthRange2: ClosedRange<UInt> = 64...16383
    static let publicKeySize: UInt = 32
    static let prefix = "SS58PRE"
    static let prefixSize: UInt = 2
}
