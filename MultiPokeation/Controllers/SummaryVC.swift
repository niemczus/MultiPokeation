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
    var collectionImages: [Int] = []
    var collectionNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettings()
        changeUI()
    }
    
    @IBAction func didTapCollectionButton(_ sender: UIButton) {
        addToCollection()
        saveSettings()
    }
    
    @IBAction func didTapTrainAnotherButton(_ sender: UIButton) {
        addToCollection()
        saveSettings()
    }
    
    func loadSettings() {
        pokemonName = UserDefaults.standard.string(forKey: Statics.pokemonName.rawValue) ?? "error"
        pokemonNumber = UserDefaults.standard.integer(forKey: Statics.pokemonNumber.rawValue)
        guard
            let collectionImages = UserDefaults.standard.array(forKey: Statics.collectionImages.rawValue) as? Array<Int>,
            let collectionNames = UserDefaults.standard.array(forKey: Statics.collectionNames.rawValue) as? Array<String>
        else { return }
        self.collectionImages = collectionImages
        self.collectionNames = collectionNames
     }
    
    func saveSettings() {
        UserDefaults.standard.set(collectionImages, forKey: Statics.collectionImages.rawValue)
        UserDefaults.standard.set(collectionNames, forKey: Statics.collectionNames.rawValue)
    }
    
    func changeUI() {
        pokemonNameLabel.text = pokemonName
        pokemonImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
        setGradientBackground(colorTop: CGColor(red: 255/255, green: 209/255 , blue: 36/255, alpha: 1), colorBottom: CGColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1))
    }
    
    func addToCollection() {
        collectionImages.append(pokemonNumber)
        collectionNames.append(pokemonName)
    }
}
