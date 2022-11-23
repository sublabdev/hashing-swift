import XCTest
import HashingSwift

class TestSS58: XCTestCase {
    private let testCases: [TestCase] = [
        .init(
            value: "HNZata7iMYWmk5RvZRTiAsSDhV8366zq2YGb3tLH5Upf74F",
            expectedHash: "0xd43593c715fdd31c61141abd04a99fd6822c8558854ccde39a5684e7a56da27d".hex.decode()
        ),
        .init(
            value: "jHEP5XeYLTTGzjhXroSczrWbV928KaxDQiQH6WakYtRjWuUzK",
            expectedHash: "0x65766d3a7dd4dda4ec7344de16fde4f0c08c95f038e99e960000000000000000".hex.decode()
        )
    ]
    
    func testAddressesDecoding() {
        for testCase in testCases {
            do {
                let publicKey = try testCase.value.ss58.publicKey()
                XCTAssertEqual(publicKey, testCase.expectedHash)
                
                let networkType = try testCase.value.ss58.networkType()
                let address = try publicKey.ss58.address(type: networkType)
                XCTAssertEqual(testCase.value, address)
            } catch let error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
