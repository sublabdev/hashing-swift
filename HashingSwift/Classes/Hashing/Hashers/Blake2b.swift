import Foundation
import BlakeSwift

private extension Data {
    func blake2b(size: Int) -> Data? {
        guard var blake2b = Blake2b(size: size) else {
            return nil
        }
        
        guard blake2b.update(from: self) else {
            return nil
        }
        
        return blake2b.digest()
    }
}

extension Hashing {
    public func blake2b_128() -> Data? {
        data.blake2b(size: 128)
    }
    
    public func blake2b_160() -> Data? {
        data.blake2b(size: 160)
    }
    
    public func blake2b_256() -> Data? {
        data.blake2b(size: 256)
    }
    
    public func blake2b_384() -> Data? {
        data.blake2b(size: 384)
    }
    
    public func blake2b_512() -> Data? {
        data.blake2b(size: 512)
    }
}
