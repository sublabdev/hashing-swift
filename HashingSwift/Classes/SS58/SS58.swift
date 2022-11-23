import Foundation

struct SS58 {
    enum Error: Swift.Error {
        // rename the errors (remove Exception)
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
