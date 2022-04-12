//
//  EvolutionVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 30/03/2022.
//

import UIKit

class EvolutionVC: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemonName = ""
    var evolutionNumber = 1
    var pokemonNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
        changeUI()
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segueEvolutionVCToMainVC", sender: .none)
    }
    
    func loadSettings() {
        pokemonName = UserDefaults.standard.string(forKey: Static.pokemonName.rawValue) ?? "error"
        evolutionNumber = UserDefaults.standard.integer(forKey: Static.evolutionNumber.rawValue)
        pokemonNumber = UserDefaults.standard.integer(forKey: Static.pokemonNumber.rawValue)
     }
    
    func changeUI() {
        pokemonImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
        pokemonNameLabel.text = pokemonName
        setGradientBackground(colorTop: UIColor(red: 242/255, green: 74/255, blue: 114/255, alpha: 1).cgColor, colorBottom: UIColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1).cgColor)
    }
}
