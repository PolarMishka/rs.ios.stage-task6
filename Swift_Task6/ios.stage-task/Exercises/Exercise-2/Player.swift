//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if hand!.contains(where: { $0.value == card.value }) {
            return true
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {

        for card in table.values {
            if hand!.contains(where: { $0.value == card.value }) {
                return true
            }
        }
        
        for card in table.keys {
            if hand!.contains(where: { $0.value == card.value }) {
                return true
            }
        }
        return false
    }
}
