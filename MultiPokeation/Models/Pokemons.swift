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
    Pokemon(firstEvolution: Details(name: "Caterpie", number: 10), secondEvolution: Details(name: "Metapod", number: 11), thirdEvolution: Details(name: "Butterfree", number: 12)),
    Pokemon(firstEvolution: Details(name: "Dratini", number: 147), secondEvolution: Details(name: "Dragonair", number: 148), thirdEvolution: Details(name: "Dragonite", number: 149)),
    Pokemon(firstEvolution: Details(name: "Poliwag", number: 60), secondEvolution: Details(name: "Poliwhirl", number: 61), thirdEvolution: Details(name: "Poliwrath", number: 62)),
    Pokemon(firstEvolution: Details(name: "Horsea", number: 116), secondEvolution: Details(name: "Seadra", number: 117), thirdEvolution: Details(name: "Kingdra", number: 230)),
    Pokemon(firstEvolution: Details(name: "Weedle", number: 13), secondEvolution: Details(name: "Kakuna", number: 14), thirdEvolution: Details(name: "Beedrill", number: 15)),
    Pokemon(firstEvolution: Details(name: "Cleffa", number: 173), secondEvolution: Details(name: "Clefairy", number: 35), thirdEvolution: Details(name: "Clefable", number: 36)),
    Pokemon(firstEvolution: Details(name: "Zubat", number: 41), secondEvolution: Details(name: "Golbat", number: 42), thirdEvolution: Details(name: "Crobat", number: 169)),
    Pokemon(firstEvolution: Details(name: "Oddish", number: 43), secondEvolution: Details(name: "Gloom", number: 44), thirdEvolution: Details(name: "Vileplume", number: 45)),
    Pokemon(firstEvolution: Details(name: "Abra", number: 63), secondEvolution: Details(name: "Kadabra", number: 64), thirdEvolution: Details(name: "Alakazam", number: 65)),
    Pokemon(firstEvolution: Details(name: "Machop", number: 66), secondEvolution: Details(name: "Machoke", number: 67), thirdEvolution: Details(name: "Machamp", number: 68)),
    Pokemon(firstEvolution: Details(name: "Bellsprout", number: 69), secondEvolution: Details(name: "Weepinbell", number: 70), thirdEvolution: Details(name: "Victreebel", number: 71)),
    Pokemon(firstEvolution: Details(name: "Geodude", number: 74), secondEvolution: Details(name: "Graveler", number: 75), thirdEvolution: Details(name: "Golem", number: 76)),
    Pokemon(firstEvolution: Details(name: "Cyndaquil", number: 155), secondEvolution: Details(name: "Quilava", number: 156), thirdEvolution: Details(name: "Typhlosion", number: 157)),
    Pokemon(firstEvolution: Details(name: "Togepi", number: 175), secondEvolution: Details(name: "Togetic", number: 176), thirdEvolution: Details(name: "Togekiss", number: 468)),
    Pokemon(firstEvolution: Details(name: "Mareep", number: 179), secondEvolution: Details(name: "Flaaffy", number: 180), thirdEvolution: Details(name: "Ampharos", number: 181)),
    Pokemon(firstEvolution: Details(name: "Chimchar", number: 390), secondEvolution: Details(name: "Monferno", number: 391), thirdEvolution: Details(name: "Infernape", number: 392)),
    Pokemon(firstEvolution: Details(name: "Shinx", number: 403), secondEvolution: Details(name: "Luxio", number: 404), thirdEvolution: Details(name: "Luxray", number: 405))
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

