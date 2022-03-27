//
//  MainVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 26/03/2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var returnView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var evolutionNumer = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        loadSettings()
        returnView.layer.cornerRadius = 25
        
    }
    
   func loadSettings() {
        guard
            let settings = UserDefaults.standard.dictionary(forKey: "settings"),
            let username = settings["username"] as? String,
            let pokemonName = settings["pokemonName"] as? String,
            let pokemonNumber = settings["pokemonNumber"] as? Int
       else { print("failed"); return }
       nameLabel.text = username
       pokemonLabel.text = pokemonName
       evolutionLabel.text = "Evolution \(evolutionNumer)"
       pokemonImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
    }
}



