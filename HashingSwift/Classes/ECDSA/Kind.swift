import Foundation

enum Kind {
    case substrate
    case ethereum
    
    func hash(hashing: Hashing) -> Data? {
        switch self {
        case .substrate:
            return hashing.blake2b_256()
        case .ethereum:
            // TODO: Implement it
            //return hashing.keccak256()
            return nil
        }
    }
}
