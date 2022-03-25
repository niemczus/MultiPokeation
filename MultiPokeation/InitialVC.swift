//
//  ViewController.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 21/03/2022.
//

import UIKit

class InitialVC: UIViewController {
    
    
    @IBOutlet weak var firstEvolutionImageView: UIImageView!
    @IBOutlet weak var secondEvolutionImageView: UIImageView!
    @IBOutlet weak var thirdEvolutionImageView: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    
    let pokemons = [
        Pokemon(firstEvolution: Details(evolutionName: "Pichu", evolutionNumber: 172), secondEvolution: Details(evolutionName: "Pikachu", evolutionNumber: 25), thirdEvolution: Details(evolutionName: "Raichu", evolutionNumber: 26)),
        Pokemon(firstEvolution: Details(evolutionName: "Igglybuff", evolutionNumber: 174), secondEvolution: Details(evolutionName: "Jigglypuff", evolutionNumber: 39), thirdEvolution: Details(evolutionName: "Wigglytuff", evolutionNumber: 40)),
        Pokemon(firstEvolution: Details(evolutionName: "Bulbasaur", evolutionNumber: 1), secondEvolution: Details(evolutionName: "Ivysaur", evolutionNumber: 2), thirdEvolution: Details(evolutionName: "Venusaur", evolutionNumber: 3)),
        Pokemon(firstEvolution: Details(evolutionName: "Charmander", evolutionNumber: 4), secondEvolution: Details(evolutionName: "Charmeren", evolutionNumber: 5), thirdEvolution: Details(evolutionName: "Charizard", evolutionNumber: 6))

        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        firstEvolutionImageView.layer.cornerRadius = 15
        secondEvolutionImageView.layer.cornerRadius = 15
        thirdEvolutionImageView.layer.cornerRadius = 15
        
        setGradientBackground()
        getPokemons(firstID: pokemons[0].firstEvolution.evolutionNumber, secondID: pokemons[0].secondEvolution.evolutionNumber, thirdID: pokemons[0].thirdEvolution.evolutionNumber)
        
    }
    
    func getPokemons(firstID: Int, secondID: Int, thirdID: Int) {
        
        firstEvolutionImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(firstID).png")
        secondEvolutionImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(secondID).png")
        thirdEvolutionImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(thirdID).png")
    }
}


extension InitialVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pokemons.count
    }
   
}

extension InitialVC:  UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return "\(pokemons[row].secondEvolution.evolutionName)"
       }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getPokemons(firstID: pokemons[row].firstEvolution.evolutionNumber, secondID: pokemons[row].secondEvolution.evolutionNumber, thirdID: pokemons[row].thirdEvolution.evolutionNumber)
    }

}

extension UIImageView {
    func loadFrom(urlAdress: String) {
        guard let url = URL(string: urlAdress) else { return }
        
        DispatchQueue.main.async {
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self.image = loadedImage
                }
            }
        }
    }
}

extension UIViewController {
    func setGradientBackground() {
        let colorTop =  UIColor(red: 57.0/255.0, green: 174.0/255.0, blue: 169/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 162.0/255.0, green: 213.0/255.0, blue: 171.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
