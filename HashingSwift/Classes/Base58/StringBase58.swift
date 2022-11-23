import Foundation
import Base58Swift

public struct StringBase58 {
    private let string: String
    
    public init(string: String) {
        self.string = string
    }
    
    public func decode() -> Data {
        guard let decodedValue = Base58.base58Decode(string) else {
            return Data()
        }
        
        return Data(decodedValue)
    }
}

extension String {
    public var base58: StringBase58 {
        .init(string: self)
    }
}
