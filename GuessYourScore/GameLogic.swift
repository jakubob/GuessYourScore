//
//  GameLogic.swift
//  GuessYourScore
//
//

import Foundation

struct GameLogic {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        
        let difference = abs(target - sliderValue)
        var bonus: Int
        
        if difference == 0 {
            bonus = 100
        }
        else if difference <= 2 {
            bonus = 50
        }
        else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        round += 1
        score += points
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
