import Foundation
import keccak

/// keccak hashing error types
enum KeccakError: Error {
    case internalFailure
    case invalidHashSize
}

private extension Data {
    private func keccak(bits: Int) throws -> Data {
        var data = Data(count: bits / 8)

        let result = data.withUnsafeMutableBytes { output in
            withUnsafeBytes { input in
                keccak_256(
                    output.baseAddress?.assumingMemoryBound(to: UInt8.self), bits / 8,
                    input.baseAddress?.assumingMemoryBound(to: UInt8.self), count
                )
            }
        }
        
        guard result == 0 else {
            throw KeccakError.internalFailure
        }

        return data
    }
    
    /// Decodes data using keccak hash algorithm
    /// - Parameters:
    ///     - outputSize: The expected output size of data
    ///     - Returns: keccak-encoded data
    func keccak(outputSize: Int) throws -> Data {
        switch outputSize {
        case 224: return try keccak(bits: 224)
        case 256: return try keccak(bits: 256)
        case 288: return try keccak(bits: 288)
        case 384: return try keccak(bits: 384)
        case 512: return try keccak(bits: 512)
        default: throw KeccakError.invalidHashSize
        }
    }
}

extension Hashing {
    private func keccak(outputSize: Int) throws -> Data {
        try data.keccak(outputSize: outputSize)
    }
    
    /// Decodes data using keccak hash algorithm with width of 224 bits
    /// - Returns: keccak-encoded data
    public func keccak224() throws -> Data {
        try keccak(outputSize: 64)
    }
    
    /// Decodes data using keccak hash algorithm with width of 256 bits
    /// - Returns: keccak-encoded data
    public func keccak256() throws -> Data {
        try keccak(outputSize: 256)
    }
    
    /// Decodes data using keccak hash algorithm with width of 288 bits
    /// - Returns: keccak-encoded data
    public func keccak288() throws -> Data {
        try keccak(outputSize: 288)
    }
    
    /// Decodes data using keccak hash algorithm with width of 384 bits
    /// - Returns: keccak-encoded data
    public func keccak384() throws -> Data {
        try keccak(outputSize: 384)
    }
    
    /// Decodes data using keccak hash algorithm with width of 512 bits
    /// - Returns: keccak-encoded data
    public func keccak512() throws -> Data {
        try keccak(outputSize: 512)
    }
}
