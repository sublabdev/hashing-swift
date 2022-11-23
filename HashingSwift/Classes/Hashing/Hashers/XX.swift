import Foundation
import xxHash_Swift
import CommonSwift

private extension Data {
    func xx(width: Int64) -> Data {
        (0..<width / 64).compactMap {
            let xxHash64 = XXH64(UInt64($0))
            let _ = xxHash64.update(self)
            guard let result = xxHash64.digestHex().hex.decode()?.reversed() else {
                return Data()
            }
            return Data(result)
        }
        .reduce(Data()) { $0 + $1 }
    }
}

extension Hashing {
    public func xx64() -> Data {
        data.xx(width: 64)
    }
    
    public func xx128() -> Data {
        data.xx(width: 128)
    }
    
    public func xx256() -> Data {
        data.xx(width: 256)
    }
}
