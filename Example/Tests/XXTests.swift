import XCTest
import HashingSwift

class XXTests: XCTestCase {
    private let xxh128TestCases: [TestCase] = [
        .init(value: "Sudo", expectedHash: "0x5c0d1176a568c1f92944340dbfed9e9c".hex.decode()),
        .init(value: "Key", expectedHash: "0x530ebca703c85910e7164cb7d1c9e47b".hex.decode()),
        .init(value: "Balances", expectedHash: "0xc2261276cc9d1f8598ea4b6a74b15c2f".hex.decode()),
        .init(value: "FreeBalance", expectedHash: "0x6482b9ade7bc6657aaca787ba1add3b4".hex.decode())
    ]
    
    func testXX128() {
        for testCase in xxh128TestCases {
            guard let valueData = testCase.value.data(using: .utf8) else {
                XCTFail()
                return
            }
            
            let dataHash = valueData.hashing.xx128()
            XCTAssertEqual(dataHash, testCase.expectedHash)
            
            let stringHash = testCase.value.hashing.xx128()
            XCTAssertEqual(stringHash, testCase.expectedHash)
        }
    }
}
