class FractionRecurring {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        // Q: How to determine if a fractional part is going to repeat
        // A: base on remain after dividing value a/b,
        // Q: How many number in parentheses if fractional part is repeating?
        // A: the number if exist is in range [1, denominator]

        // algorithm
        // if dividend is zero
            // return zero as a string
        // if divisor is zero, result is undefined
        // if either dividend-numerator or divisor-denominator is negative (not both)
            // append - to result string
        // numerator = abs(numerator)
        // denominator = abs(denominator)
        // append numerator/denominator to result string
        // calculate remainder = numerator % denominator
        // if remainder is zero
            // return result string
        // append . to result string
        // while remainder is not zero
            // append quotient = remainder * 10 / denominator to result string
            // also insert quotient to a map with key is quotient, value is position of that quotient in result string
            // if we found a repeated remainder we know that the number is gonna repeating -> add ( and ) base on the position in the map

        if numerator == 0 {
            return "0"
        }

        if denominator == 0 {
            return "undefined"
        }

        var result = ""
        if (numerator < 0 && denominator > 0) || (numerator > 0 && denominator < 0) {
            result += "-"
        }

        var n = abs(numerator)
        var d = abs(denominator)
        result += "\(n/d)"
        var remainder = n % d
        if remainder == 0 {
            return result
        }

        result += "."

        var map = [Int: Int]()
        while remainder != 0 {
            if map[remainder] != nil {
                // Okay found it
                let pos = map[remainder]!
                let posIndex = result.index(result.startIndex, offsetBy: pos)
                result.insert("(", at: posIndex)
                result += ")"
                return result
            }
            map[remainder] = result.count
            let quotient = remainder * 10 / d
            result += "\(quotient)"
            remainder = (remainder * 10) % d
        }

        return result
    }
}
