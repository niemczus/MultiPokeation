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
    
    var pokemonName = Settings.shared.pokemonName
    var pokemonNumber = Settings.shared.pokemonNumber
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeUI()
    }
    
    @IBAction func didTapCollectionButton(_ sender: UIButton) {
        addToCollection()
    }
    
    @IBAction func didTapTrainAnotherButton(_ sender: UIButton) {
        addToCollection()
    }

    func changeUI() {
        pokemonNameLabel.text = pokemonName
        let pokemonImage = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
        pokemonImageView.kf.setImage(with: pokemonImage)
        setGradientBackground(colorTop: CGColor(red: 255/255, green: 209/255 , blue: 36/255, alpha: 1), colorBottom: CGColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1))
    }
    
    func addToCollection() {
        Settings.shared.collectionImages.append(pokemonNumber)
        Settings.shared.collectionNames.append(pokemonName)
    }
}
