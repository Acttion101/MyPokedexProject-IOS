//
//  Card.swift
//  MyPokedexProject
//
//  Created by pongpon on 9/2/2564 BE.
//

import Foundation
struct Card: Codable {
    
    let id: String
    let name: String 
    let isSelcted: Bool
    let imageUrl : String
    let hp: Int
    let rarity: Int
    let attacks:Attacks
    let weaknesses:Weaknesses
}
struct Attacks: Codable {
    let name: String
    let damage: Int
}
struct Weaknesses: Codable {
    let type: String
    let value: Int
}


