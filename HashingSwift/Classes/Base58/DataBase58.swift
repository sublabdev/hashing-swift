import Foundation
import Base58Swift

public struct DataBase58 {
    private let data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    public func encode() -> String {
        Base58.base58Encode(Array(data))
    }
}

extension Data {
    public var base58: DataBase58 {
        .init(data: self)
    }
}
