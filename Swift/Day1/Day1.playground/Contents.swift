//: Playground - noun: a place where people can play

import UIKit

func numberFloorsUp(input: String) -> Int
{
    let filteredInput = input.stringByReplacingOccurrencesOfString(")", withString: "")
    return filteredInput.characters.count
}

func numberFloorsDown(input: String) -> Int
{
    let filteredInput = input.stringByReplacingOccurrencesOfString("(", withString: "")
    return filteredInput.characters.count
}

func readInput() -> String
{
    let filePath = NSBundle.mainBundle().pathForResource("day1", ofType: "input")
    
    let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
    
    let content = NSString(data: contentData!, encoding: NSUTF8StringEncoding) as? String
    return content as String!
}

func floorDirection(direction: Character) -> Int
{
    if direction == "("  {
        return 1
    }
    else {
        return -1
    }
}

func partOne()
{
    let input = readInput()

    let floorsUp = numberFloorsUp(input)
    let floorsDown = numberFloorsDown(input)

    let finalFloor = floorsUp - floorsDown

    print(finalFloor)
}

func partTwo()
{
    let input = readInput()
    
    var currentFloor = 0
    var charPosition = 0
    
    for floor in input.characters {
        currentFloor += floorDirection(floor)
        charPosition++
        
        if currentFloor == -1
        {
            print(charPosition)
            break;
        }
    }
}
