import UIKit

var str = "Hello, playground"

for i in 0 ..< str.count {
    print(str[str.startIndex ..< str.index(str.startIndex, offsetBy: i)])
    print(str[str.index(str.startIndex, offsetBy: i + 1)...])
    print("-----------------")
}

// NSRange
let r0 = NSMakeRange(-2, 5)
let r1 = NSMakeRange(0, 2)
let r2 = NSMakeRange(2, 6)
let r3 = NSMakeRange(5, 9)
//print(r0.length)
//print(r0.lowerBound)
//print(r0.upperBound)
//print("----------")
//print(r1.length)
//print(r1.lowerBound)
//print(r1.upperBound)
//print(NSIntersectionRange(r0, r1).length)
//print(NSIntersectionRange(r0, r1).lowerBound)
//print(NSIntersectionRange(r0, r1).upperBound)
//print(NSIntersectionRange(r1, r2).lowerBound)
//print(NSIntersectionRange(r1, r2).upperBound)
//print(NSIntersectionRange(r1, r3).length) // returning 0 because r1 and r3 are not intersected
print(NSUnionRange(r1, r3).length)
print(NSUnionRange(r1, r3).lowerBound)
print(NSUnionRange(r1, r3).upperBound)
print(NSUnionRange(r1, r3).contains(4))
//let r4 = Range.init(r0)

let i = NSInteger.init(1)
// i.copy => cannot copy an integer
let n = NSNumber.init(value: 1)
n.copy()

let v = UIView()
v.sizeThatFits(CGSize.init(width: 10, height: 10))
v.sizeToFit()
v.setNeedsLayout()
v.layoutSubviews()


var a1 = NSArray()
a1.adding(CGColor.init(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
//a1.add
//a1.append(CGColor.init(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
var a2 = [Date]()
var a3 = [Int]()
var a4 = [NSObject]()
