### XX Example

*NOTE:* `CommonSwift` library can be found [here](https://github.com/sublabdev/common-swift).
The `hex` extension for `String` is defined in `CommonSwift` library.

```Swift
import HashingSwift
import CommonSwift

let value = "Sudo"
let valueData = value.data(using: .utf8)
let dataHash = valueData.hashing.xx128()
```
In the above code snippet we decode data using using `XX` hash algorithm with width of 128 bits.
The result is equal to `"0x5c0d1176a568c1f92944340dbfed9e9c".hex.decode())`.

Also, we can get `String`'s hash this way.

```Swift
let stringHash = testCase.value.hashing.xx128()
```
Here we are using `hashing` extension defined on `String`. The hashed string is equal to `"0x5c0d1176a568c1f92944340dbfed9e9c".hex.decode())`.