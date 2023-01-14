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
