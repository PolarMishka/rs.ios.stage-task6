//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player], values:[Value] ) -> Player? {
        var firstAttackingPlayer = Player()
        var dictOfTrumpCards = [Value: Player]()
        for player in players {
            for i in 0 ..< 6 {
                if player.hand![i].isTrump == true {
                    dictOfTrumpCards.updateValue(players[i], forKey: Value(rawValue: player.hand![i].value.rawValue)!)
                }
            }
        }
       // firstAttackingPlayer = dictOfTrumpCards[dictOfTrumpCards.keys.min()!]!
        
        let minPriv = dictOfTrumpCards.min { a, b in a.key.rawValue < b.key.rawValue }
        firstAttackingPlayer = minPriv!.value
        
        return firstAttackingPlayer
    }
}
