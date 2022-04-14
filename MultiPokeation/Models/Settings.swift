//
//  Settings.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 13/04/2022.
//

import Foundation
import PokemonAPI

class Settings {
    private let defaults = UserDefaults.standard

    var usernameKey = Statics.username.rawValue
    var username: String {
        set {
            defaults.setValue(newValue, forKey: usernameKey)
        }
        get {
            return defaults.string(forKey: usernameKey) ?? ""
        }
    }
    
    var pokemonNameKey = Statics.pokemonName.rawValue
    var pokemonName: String {
        set {
            defaults.setValue(newValue, forKey: pokemonNameKey)
        }
        get {
            return defaults.string(forKey: pokemonNameKey) ?? ""
        }
    }
    
    var pokemonNumberKey = Statics.pokemonNumber.rawValue
    var pokemonNumber: Int {
        set {
            defaults.setValue(newValue, forKey: pokemonNumberKey)
        }
        get {
            return defaults.integer(forKey: pokemonNumberKey)
        }
    }
    
    var firstChooseKey = Statics.firstChoose.rawValue
    var firstChoose: String {
        set {
            defaults.setValue(newValue, forKey: firstChooseKey)
        }
        get {
            return defaults.string(forKey: firstChooseKey) ?? "first"
        }
    }
    
    var evolutionNumberKey = Statics.evolutionNumber.rawValue
    var evolutionNumber: Int {
        set {
            defaults.setValue(newValue, forKey: evolutionNumberKey)
        }
        get {
            let number = defaults.integer(forKey: evolutionNumberKey)
            if number > 1 {
                return number
            } else { return 1 }
        }
    }
    
    var pokemonKey = Statics.pokemon.rawValue
    var pokemon: Int {
        set {
            defaults.setValue(newValue, forKey: pokemonKey)
        }
        get {
            return defaults.integer(forKey: pokemonKey)
        }
    }
    
    var collectionImagesKey = Statics.collectionImages.rawValue
    var collectionImages: [Int] {
        set {
            defaults.setValue(newValue, forKey: collectionImagesKey)
        }
        get {
            return defaults.array(forKey: collectionImagesKey) as? [Int] ?? []
        }
    }
    
    var collectionNamesKey = Statics.collectionNames.rawValue
    var collectionNames: [String] {
        set {
            defaults.setValue(newValue, forKey: collectionNamesKey)
        }
        get {
            return defaults.stringArray(forKey: collectionNamesKey) ?? []
        }
    }
    
    var scoreKey = Statics.score.rawValue
    var score: Int {
        set {
            defaults.setValue(newValue, forKey: scoreKey)
        }
        get {
            return defaults.integer(forKey: scoreKey)
        }
    }
    
    class var shared: Settings {
        struct Static {
            static let instance = Settings()
        }
        return Static.instance
    }
}
