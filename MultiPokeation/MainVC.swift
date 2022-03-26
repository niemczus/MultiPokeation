//
//  MainVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 26/03/2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        loadSettings()
        
    }
    
   func loadSettings() {
        guard
            let settings = UserDefaults.standard.dictionary(forKey: "settings"),
            let username = settings["username"] as? String,
            let pokemon = settings["pokemon"] as? Pokemon
       else { return }
       nameLabel.text = username
       pokemonLabel.text = pokemon.firstEvolution.name
       evolutionLabel.text = "Evolution \(1)"
       pokemonImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemon.firstEvolution.number).png")
                
    }
    
}

