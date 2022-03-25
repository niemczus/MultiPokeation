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
    let evolutionName: String
    let evolutionNumber: Int
}



