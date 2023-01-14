import Foundation

struct TestCase {
    let value: String
    var expectedHash: () throws -> Data
}
