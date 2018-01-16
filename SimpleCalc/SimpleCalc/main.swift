//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let possibleOperations : [String] = ["+", "-", "*", "/", "%"]
        if (args.count == 3 && possibleOperations.contains(args[1])) {
            switch args[1] {
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            case "/":
                return Int(args[0])! / Int(args[2])!
            case "%":
                return Int(args[0])! % Int(args[2])!
            default:
                return 0
            }
        } else if (args.count > 1) {
            let operation : String = args[args.count - 1]
            switch operation {
            case "count":
                return args.count - 1
            case "avg":
                var total : Int = 0
                for index in 0...args.count - 2 {
                    total += Int(args[index])!
                }
                return total / (args.count - 1)
            case "fact":
                var total : Int = 1
                for number in 1...Int(args[0])! {
                    total *= number
                }
                return total
            default:
                return 0
            }
        }
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

