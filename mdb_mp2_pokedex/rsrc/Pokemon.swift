//
//  Pokemon.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Foundation

class Pokemon {
    
    static let ALL_POKEMON_TYPES = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    
    static let ALL_POKE_FILTERS = ALL_POKEMON_TYPES + ["Attack", "Defense", "HP"]
    
    
    /* Note 1: 
       There are 18 different types of Pokemon, and a single Pokemon can inherit multiple types:
            Bug, Grass, Dark, Ground, Dragon, Ice, Electric, Normal, Fairy,
            Poison, Fighting, Psychic, Fire, Rock, Flying, Steel, Ghost, Water
    */
    
    /* Note 2:
       The image for each Pokemon is not provided, but a URL is. You should look up how to get an image from it's URL.
    */
    
    /* Note 3:
       You can access the properties of Pokemon using dot notation (e.g. pokemon.name, pokemon.number, etc.)
     */
 
    let name: String!
    let number: Int!
    
    let attack: Int!
    let defense: Int!
    let health: Int!
    let specialAttack: Int!
    let specialDefense: Int!
    let speed: Int!
    let total: Int!
    
    let species: String!
    let types: [String]
    let imageUrl: String!
    let stats: [Int]!
    static let statNames = ["Attack", "Defense", "Health", "Special Attack", "Special Defense", "Speed", "Total"]
    let uid: Int!
    
    init(name: String, number: Int, attack: Int, defense: Int, health: Int, spAttack: Int, spDef: Int, species: String, speed: Int, total: Int, types: [String], uid: Int) {
        self.name = name
        self.number = number
        self.attack = attack
        self.defense = defense
        self.health = health
        self.specialAttack = spAttack
        self.specialDefense = spDef
        self.species = species
        self.speed = speed
        self.total = total
        self.types = types
        self.imageUrl = "http://img.pokemondb.net/artwork/\(name.components(separatedBy: " ")[0].lowercased()).jpg"
        self.stats = [self.attack, self.defense, self.health, self.specialAttack, self.specialDefense, self.speed, self.total]
        self.uid = uid
    }
    
}
