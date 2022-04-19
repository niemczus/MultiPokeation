//
//  ViewController.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 21/03/2022.
//

import UIKit
import Kingfisher

class InitialVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var firstEvolutionImageView: UIImageView!
    @IBOutlet weak var secondEvolutionImageView: UIImageView!
    @IBOutlet weak var thirdEvolutionImageView: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    
    var pokemon: Int = 0 {
        didSet {
            Settings.shared.pokemon = pokemon
        }
    }
    
    var pokemonName: String = pokemons[0].firstEvolution.name {
        didSet {
            Settings.shared.pokemonName = pokemonName
        }
    }
    
    var pokemonNumber: Int = pokemons[0].firstEvolution.number {
        didSet {
            Settings.shared.pokemonNumber = pokemonNumber
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameTextField.delegate = self
        picker.dataSource = self
        picker.delegate = self
        
        setupHideKeyboardOnTap()
        changeUI()
        
        Settings.shared.pokemon = pokemon
        Settings.shared.pokemonName = pokemonName
        Settings.shared.pokemonNumber = pokemonNumber
    }
    
    @IBAction func nameTextView(_ sender: UITextField) {
        Settings.shared.username = nameTextField.text ?? ""
        resignFirstResponder()
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        Settings.shared.firstChoose = "another"
    }
    
    func getPokemons(firstID: Int, secondID: Int, thirdID: Int) {
        let firstEvolutionImage = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(firstID).png")
        firstEvolutionImageView.kf.setImage(with: firstEvolutionImage)
        let secondEvolutionImage = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(secondID).png")
        secondEvolutionImageView.kf.setImage(with: secondEvolutionImage)
        let thirdEvolutionImage = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(thirdID).png")
        thirdEvolutionImageView.kf.setImage(with: thirdEvolutionImage)
    }
    
    func changeUI() {
        nameTextField.text = Settings.shared.username
        firstEvolutionImageView.layer.cornerRadius = 15
        secondEvolutionImageView.layer.cornerRadius = 15
        thirdEvolutionImageView.layer.cornerRadius = 15
        setGradientBackground(colorTop: UIColor(red: 113/255, green: 43/255, blue: 117/255, alpha: 1).cgColor, colorBottom: UIColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1).cgColor)
        DispatchQueue.main.async {
            self.getPokemons(firstID: pokemons[0].firstEvolution.number, secondID: pokemons[0].secondEvolution.number, thirdID: pokemons[0].thirdEvolution.number)
        }
    }
}

extension InitialVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pokemons.count
    }
}

extension InitialVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}

extension InitialVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getPokemons(firstID: pokemons[row].firstEvolution.number, secondID: pokemons[row].secondEvolution.number, thirdID: pokemons[row].thirdEvolution.number)
        pokemonName = pokemons[row].firstEvolution.name
        pokemonNumber = pokemons[row].firstEvolution.number
        pokemon = row
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "MontserratAlternates-Regular", size: 25)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = "\(pokemons[row].firstEvolution.name)"
        pickerLabel?.textColor = UIColor(named: "orange")
        
        return pickerLabel!
    }
}
