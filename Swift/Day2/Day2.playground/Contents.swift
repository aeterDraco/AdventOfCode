//: Playground - noun: a place where people can play

import UIKit

func readInput() -> String
{
    let filePath = NSBundle.mainBundle().pathForResource("Day2", ofType: "input")
    
    let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
    
    let content = NSString(data: contentData!, encoding: NSUTF8StringEncoding) as? String
    return content as String!
}

func formatInput(input: String) -> Array<Array<String>>
{
    var presents = []
    let presentList = input.componentsSeparatedByString("\n")
    
    for present in presentList {
        presents = presents.arrayByAddingObject(present.componentsSeparatedByString("x"))
    }
    
    return presents as! Array<Array<String>>
}

func presentsSize(measurements: Array<String>) -> Int
{
    let l = Int(measurements[0])!
    let h = Int(measurements[1])!
    let w = Int(measurements[2])!

    let s1 = l*w
    let s2 = l*h
    let s3 = h*w
    
    let minSize = min(min(s1,s2), s3)
    
    let paperSize = (2*s1)+(2*s2)+(2*s3)+minSize

    return paperSize
}

func ribbonSize(var measurements: Array<String>) -> Int
{
    let l = Int(measurements[0])!
    let h = Int(measurements[1])!
    let w = Int(measurements[2])!
   
    let ribbon = l*h*w
    
    let s1 = 2*(l+h)
    let s2 = 2*(l+w)
    let s3 = 2*(w+h)
    
    return ribbon + (min(min(s1,s2),s3))
}

func part1(){
    let input = formatInput(readInput())
    var paperSize = 0
    
    for present in input {
        paperSize += presentsSize(present)
    }
    
    print(paperSize)
}

func part2()
{
    let input = formatInput(readInput())
    var tape = 0
    
    for present in input {
        tape += ribbonSize(present)
    }
    
    print(tape)
}

part2()

