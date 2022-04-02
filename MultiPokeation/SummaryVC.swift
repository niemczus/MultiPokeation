//
//  SummaryVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 30/03/2022.
//

import UIKit

class SummaryVC: UIViewController {

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var pokemonName = ""
    var pokemonNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(colorTop: CGColor(red: 255/255, green: 209/255 , blue: 36/255, alpha: 1), colorBottom: CGColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1))
        loadSettings()
        changeUI()
        
        
    }
    
    @IBAction func didTapCollectionButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapTrainAnotherButton(_ sender: UIButton) {
    }
    func loadSettings() {
        pokemonName = UserDefaults.standard.string(forKey: S.pokemonName) ?? "error"
        pokemonNumber = UserDefaults.standard.integer(forKey: S.pokemonNumber)
     }
    func changeUI() {
        pokemonNameLabel.text = pokemonName
        pokemonImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
    }
}
