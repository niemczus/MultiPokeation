//
//  Pokemons.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 25/03/2022.
//

import Foundation
import PokemonAPI

struct Pokemon {
    let firstEvolution: Details
    let secondEvolution: Details
    let thirdEvolution: Details
}

struct Details {
    let name: String
    let number: Int
    let evolution: Int = 1
}

let pokemons = [
    Pokemon(firstEvolution: Details(name: "Pichu", number: 172), secondEvolution: Details(name: "Pikachu", number: 25), thirdEvolution: Details(name: "Raichu", number: 26)),
    Pokemon(firstEvolution: Details(name: "Igglybuff", number: 174), secondEvolution: Details(name: "Jigglypuff", number: 39), thirdEvolution: Details(name: "Wigglytuff", number: 40)),
    Pokemon(firstEvolution: Details(name: "Bulbasaur", number: 1), secondEvolution: Details(name: "Ivysaur", number: 2), thirdEvolution: Details(name: "Venusaur", number: 3)),
    Pokemon(firstEvolution: Details(name: "Charmander", number: 4), secondEvolution: Details(name: "Charmeren", number: 5), thirdEvolution: Details(name: "Charizard", number: 6)),
    Pokemon(firstEvolution: Details(name: "Squirtle", number: 7), secondEvolution: Details(name: "Wartortle", number: 8), thirdEvolution: Details(name: "Blastoise", number: 9)),
    Pokemon(firstEvolution: Details(name: "Pidgey", number: 16), secondEvolution: Details(name: "Pidgeotto", number: 17), thirdEvolution: Details(name: "Pidgeot", number: 18)),
    Pokemon(firstEvolution: Details(name: "Igglybuff", number: 174), secondEvolution: Details(name: "Jigglypuff", number: 39), thirdEvolution: Details(name: "Wigglytuff", number: 40)),
    Pokemon(firstEvolution: Details(name: "Dratini", number: 147), secondEvolution: Details(name: "Dragonair", number: 148), thirdEvolution: Details(name: "Dragonite", number: 149)),
    Pokemon(firstEvolution: Details(name: "Poliwag", number: 60), secondEvolution: Details(name: "Poliwhirl", number: 61), thirdEvolution: Details(name: "Poliwrath", number: 62)),
    Pokemon(firstEvolution: Details(name: "Horsea", number: 116), secondEvolution: Details(name: "Seadra", number: 117), thirdEvolution: Details(name: "Kingdra", number: 230))
    ]

//Pichu - 172 / Pikachu - 25 / Raichu - 26
//Igglybuff - 174 / Jigglypuff - 39 / Wigglytuff - 40
//Bulbasaur - 1 / Ivysaur - 2 / Venusaur - 3
//Charmander  - 4 / Charmeren - 5 / Charizard - 6
//Squirtle - 7 / Wartortle - 8 / Blastoise - 9
//Pidgey - 16 / Pidgeotto - 17 /  Pidgeot - 18
//Igglybuff - 174 / Jigglypuff - 39 / Wigglytuff - 40
//Dratini - 147 / Dragonair - 148 / Dragonite - 149
//Poliwag - 60 / Poliwhirl - 61 / Poliwrath - 62
//Horsea - 116 / Seadra - 117 / Kingdra - 230

