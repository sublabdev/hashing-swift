### Blake2b Example

*NOTE:* `CommonSwift` library can be found [here](https://github.com/sublabdev/common-swift).
The `hex` extension for `String` is defined in `CommonSwift` library.

```Swift
import HashingSwift
import CommonSwift

let value = "DQHyqj4mJRegcgFFBmFmXAdCwFhAPLiVFiARBbAoU4EDhMM"
let valueData = value.data(using: .utf8)
let dataHash = try valueData.hashing.blake2b_256()
```
In the above code snippet is shown the process of hashing `Data` using `blake2b_256` algorithm.
The hashed data is equal to `"0xbcf136a9e09e0a858111de57745c2d143647677aa6d8d28606db3247a164da48".hex.decode()`.

Also, we can get `String`'s hash.

```Swift
let stringHash = try value.hashing.blake2b_256()
```
Here we are using `hashing` extension defined on `String`. The hashed string is equal to `"0xbcf136a9e09e0a858111de57745c2d143647677aa6d8d28606db3247a164da48".hex.decode()`.