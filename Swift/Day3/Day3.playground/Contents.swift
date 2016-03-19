//: Playground - noun: a place where people can play

import UIKit

struct Position {
    var x = 0
    var y = 0
    
    func getKey() -> String
    {
        return String.localizedStringWithFormat("%d,%d", x, y)
    }
    
    mutating func move(direction: Character) {
      switch(direction){
        case ">":
            self.x += 1
        case "<":
            self.x -= 1
        case "^":
            self.y += 1
        case "v":
            self.y -= 1
        default:
            break
        }
    }
}

func readInput() -> String
{
    let path = NSBundle.mainBundle().pathForResource("day3", ofType: "input")
    
    let content = NSFileManager.defaultManager().contentsAtPath(path!)
    
    let input = String(data: content!, encoding: NSUTF8StringEncoding) as String!
    
    return input
}

func part1(){
    
    let input = readInput()
    var currentPosition = Position(x: 0, y: 0)
    var housesVisited = [String: Int]()
    
    housesVisited[currentPosition.getKey()] = 1;
    for movement in input.characters {
        currentPosition.move(movement)
        
        var presents = housesVisited[currentPosition.getKey()]
        if(presents == nil) {
            presents = 0
        }
        
        housesVisited[currentPosition.getKey()] = presents! + 1
    }
    
    print(housesVisited.count)
}

func part2(){
    
    let input = readInput()
    var santaPosition = Position(x: 0, y: 0)
    var robotPosition = Position(x: 0, y: 0)
    var currentPosition = Position(x: 0, y: 0)

    var housesVisited = [String: Int]()
    
    housesVisited[santaPosition.getKey()] = 1;
    var santaMoves = true
    for movement in input.characters {
        if santaMoves {
            santaPosition.move(movement)
            currentPosition = santaPosition
        }
        else{
            robotPosition.move(movement)
            currentPosition = robotPosition
        }
        
        var presents = housesVisited[currentPosition.getKey()]
        if(presents == nil) {
            presents = 0
        }
        
        housesVisited[currentPosition.getKey()] = presents! + 1
        santaMoves = !santaMoves
    }
    
    print(housesVisited.count)
}

part2()