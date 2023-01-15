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

import XCTest
import HashingSwift

class XXTests: XCTestCase {
    private let xxh128TestCases: [TestCase] = [
        .init(value: "Sudo", expectedHash: { try "0x5c0d1176a568c1f92944340dbfed9e9c".hex.decode() }),
        .init(value: "Key", expectedHash: { try "0x530ebca703c85910e7164cb7d1c9e47b".hex.decode() }),
        .init(value: "Balances", expectedHash: { try "0xc2261276cc9d1f8598ea4b6a74b15c2f".hex.decode() }),
        .init(value: "FreeBalance", expectedHash: { try "0x6482b9ade7bc6657aaca787ba1add3b4".hex.decode() })
    ]
    
    func testXX128() throws {
        for testCase in xxh128TestCases {
            guard let valueData = testCase.value.data(using: .utf8) else {
                XCTFail()
                return
            }
            
            let dataHash = try valueData.hashing.xx128()
            XCTAssertEqual(dataHash, try testCase.expectedHash())
            
            let stringHash = try testCase.value.hashing.xx128()
            XCTAssertEqual(stringHash, try testCase.expectedHash())
        }
    }
}
