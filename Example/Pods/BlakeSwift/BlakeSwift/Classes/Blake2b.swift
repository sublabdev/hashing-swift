import Foundation

public struct Blake2b {
    private var state = blake2b_state()
    private let size: Int
    
    public init?(size: Int, key: Data? = nil) {
        // Blake2b expects to get size in bytes
        let sizeInBytes = size / 8
        self.size = sizeInBytes
        var result: Int32 = 0
        if let key = key {
            key.withUnsafeBytes { pointer in
                result = blake2b_init_key(&state, sizeInBytes, pointer.baseAddress, pointer.count)
            }
        } else {
            result = blake2b_init(&state, sizeInBytes)
        }
        guard result == 0 else {
            return nil
        }
    }
    
    public mutating func update(from data: Data) -> Bool {
        var result: Int32 = 0
        
        data.withUnsafeBytes {
            result = blake2b_update(&state, $0.baseAddress, $0.count)
        }
        
        return result == 0
    }
    
    public mutating func digest() -> Data? {
        var data = Data(repeating: 0, count: size)
        var result: Int32 = 0
        
        data.withUnsafeMutableBytes {
           result = blake2b_final(&state, $0.baseAddress, size)
        }
        
        if result == 0 {
            return data
        } else {
            return nil
        }
    }
}
