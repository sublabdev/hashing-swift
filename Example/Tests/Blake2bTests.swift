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

class Blake2bTests: XCTestCase {
    func testBlake2bWithHash() throws {
        let testCases = [(
            value: "DQHyqj4mJRegcgFFBmFmXAdCwFhAPLiVFiARBbAoU4EDhMM",
            expectedHash: { try "0xbcf136a9e09e0a858111de57745c2d143647677aa6d8d28606db3247a164da48".hex.decode() }
        )]
        
        for testCase in testCases {
            guard let valueData = testCase.value.data(using: .utf8) else {
                XCTFail()
                return
            }

            let dataHash = try valueData.hashing.blake2b_256()
            XCTAssertEqual(dataHash, try testCase.expectedHash())
            
            let stringHash = try testCase.value.hashing.blake2b_256()
            XCTAssertEqual(stringHash, try testCase.expectedHash())
        }
    }
}
