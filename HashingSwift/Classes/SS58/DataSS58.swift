import Foundation

public struct DataSS58 {
    private let data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    public func address(type: UInt) throws -> String {
        guard let prefix = SS58.prefix.data(using: .utf8) else {
            throw SS58.Error.internal
        }
        
        var publicKey: Data?
        
        if data.count > SS58.publicKeySize {
            publicKey = data.hashing.blake2b_256()
        } else {
            publicKey = data
        }
        
        guard let publicKey = publicKey else {
            throw SS58.Error.invalidPublicKey
        }
        
        let single = type & 0x3fff
        var networkType: [UInt8?]
        let networkTypeLength: Int
        
        switch type {
        case SS58.networkTypeLengthRange1:
            networkType = [.init(exactly: type)]
            networkTypeLength = 1
            
        case SS58.networkTypeLengthRange2:
            let hi = ((single & 0xfc) >> 2) | 0x40
            let lo = (single >> 8) | ((single & 0x3f) << 6)
            
            networkType = [.init(exactly: hi), .init(exactly: lo)]
            networkTypeLength = 2
            
        default:
            throw SS58.Error.invalidAddressException
        }
        
        let networkTypeData = Data(networkType.compactMap { $0 })
        
        guard
            networkTypeData.count == networkTypeLength,
            let checksum = (prefix + networkTypeData + publicKey).hashing.blake2b_512()?[0..<SS58.prefixSize]
        else {
            throw SS58.Error.internal
        }
        
        return (networkTypeData + publicKey + checksum).base58.encode()
    }
}

extension Data {
    public var ss58: DataSS58 {
        .init(data: self)
    }
}
