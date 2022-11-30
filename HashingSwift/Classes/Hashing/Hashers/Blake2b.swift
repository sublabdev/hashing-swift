import Foundation
import Blake2

private extension Data {
    enum BlakeError: Error {
        case hashingFailure(String)
    }
    
    func blake2b(size: Int) throws -> Data {
        do {
            var hasher = try Blake2(.b2b, size: size / 8)
            hasher.update(self)
            
            return try hasher.finalize()
        } catch let error {
            throw BlakeError.hashingFailure(error.localizedDescription)
        }
    }
}

extension Hashing {
    public func blake2b_128() throws -> Data {
        try data.blake2b(size: 128)
    }

    public func blake2b_160() throws -> Data {
        try data.blake2b(size: 160)
    }

    public func blake2b_256() throws -> Data {
        try data.blake2b(size: 256)
    }

    public func blake2b_384() throws -> Data {
        try data.blake2b(size: 384)
    }

    public func blake2b_512() throws -> Data {
        try data.blake2b(size: 512)
    }
}
