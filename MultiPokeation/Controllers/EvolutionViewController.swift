//
//  EvolutionVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 30/03/2022.
//

import UIKit

class EvolutionViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemonName = Settings.shared.pokemonName
    var evolutionNumber = Settings.shared.evolutionNumber
    var pokemonNumber = Settings.shared.pokemonNumber
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segueEvolutionVCToMainVC", sender: .none)
    }
    
    func setupViews() {
        let pokemonImage = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
        pokemonImageView.kf.setImage(with: pokemonImage)
        pokemonNameLabel.text = pokemonName
        setGradientBackground(colorTop: UIColor(red: 242/255, green: 74/255, blue: 114/255, alpha: 1).cgColor,
                              colorBottom: UIColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1).cgColor)
    }
}
