import Foundation

public struct Hashing {
    let data: Data
    
    public init(data: Data) {
        self.data = data
    }
}

extension Data {
    public var hashing: Hashing {
        .init(data: self)
    }
}

extension String {
    public var hashing: Hashing {
        .init(data: data(using: .utf8) ?? Data())
    }
}
