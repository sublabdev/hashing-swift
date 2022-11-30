import XCTest
import HashingSwift

class Blake2bTests: XCTestCase {
    func testBlake2bWithHash() throws {
        let testCases = [(
            value: "DQHyqj4mJRegcgFFBmFmXAdCwFhAPLiVFiARBbAoU4EDhMM",
            expectedHash: "0xbcf136a9e09e0a858111de57745c2d143647677aa6d8d28606db3247a164da48".hex.decode()
        )]
        
        for testCase in testCases {
            guard let valueData = testCase.value.data(using: .utf8) else {
                XCTFail()
                return
            }

            let dataHash = try valueData.hashing.blake2b_256()
            XCTAssertEqual(dataHash, testCase.expectedHash)
            
            let stringHash = try testCase.value.hashing.blake2b_256()
            XCTAssertEqual(stringHash, testCase.expectedHash)
        }
    }
}
