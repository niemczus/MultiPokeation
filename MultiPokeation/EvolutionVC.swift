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
    }
    
    
    @IBAction func continueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segueEvolutionVCToMainVC", sender: .none)
    }
    
    func loadSettings() {
        pokemonName = UserDefaults.standard.string(forKey: "pokemonName") ?? "Error"
        evolutionNumber = UserDefaults.standard.integer(forKey: "evolutionNumber")
        pokemonNumber = UserDefaults.standard.integer(forKey: "pokemonNumber")
     }
    
    func changeUI() {
        pokemonImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
        pokemonNameLabel.text = pokemonName
    }
    
    
}
