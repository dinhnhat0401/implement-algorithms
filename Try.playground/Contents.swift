import UIKit

var str = "Hello, playground"

for i in 0 ..< str.count {
    print(str[str.startIndex ..< str.index(str.startIndex, offsetBy: i)])
    print(str[str.index(str.startIndex, offsetBy: i + 1)...])
    print("-----------------")
}
