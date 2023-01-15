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

class SS58Tests: XCTestCase {
    private let testCases: [TestCase] = [
        .init(
            value: "J3f13B92p6aMcoHxfjz4VyDRhtQt23SgzZy5NfTz3fz2wvR",
            expectedHash: { try "0xf206618f046df7204d07788a8449d7eb08811b44cdf51afde3efd4c4fcd4dd6e".hex.decode() }
        ),
        .init(
            value: "jHEP5XeYLTTGzjhXroSczrWbV928KaxDQiQH6WakYtRjWuUzK",
            expectedHash: { try "0x65766d3a7dd4dda4ec7344de16fde4f0c08c95f038e99e960000000000000000".hex.decode() }
        )
    ]
    
    func testAddressesDecoding() throws {
        for testCase in testCases {
            do {
                let publicKey = try testCase.value.ss58.accountId()
                XCTAssertEqual(publicKey, try testCase.expectedHash())
                
                let networkType = try testCase.value.ss58.networkType()
                let address = try publicKey.ss58.address(type: networkType)
                XCTAssertEqual(testCase.value, address)
            } catch let error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
