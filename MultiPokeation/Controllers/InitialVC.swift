//
//  ViewController.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 21/03/2022.
//

import UIKit

class InitialVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var firstEvolutionImageView: UIImageView!
    @IBOutlet weak var secondEvolutionImageView: UIImageView!
    @IBOutlet weak var thirdEvolutionImageView: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    
    var pokemon = 0
    var choosenName = pokemons[0].firstEvolution.name
    var choosenNumber = pokemons[0].firstEvolution.number
    var evolutionNumber = 1
    var score = 0
    var firstChoose = "first"
    var username = Settings.shared.username
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        picker.dataSource = self
        picker.delegate = self
//        loadSettings()
        setupHideKeyboardOnTap()
        changeUI()
    }
    
    @IBAction func nameTextView(_ sender: UITextField) {
        resignFirstResponder()
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        firstChoose = "another"
        saveSettings()
    }
    
    func getPokemons(firstID: Int, secondID: Int, thirdID: Int) {
        firstEvolutionImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(firstID).png")
        secondEvolutionImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(secondID).png")
        thirdEvolutionImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(thirdID).png")
    }
    
//    func loadSettings() {
//        username = UserDefaults.standard.string(forKey: Statics.username.rawValue)
//    }
    
    func saveSettings() {
        let defaults = UserDefaults.standard
        
        defaults.set(nameTextField.text, forKey: Statics.username.rawValue)
        defaults.set(choosenName, forKey: Statics.pokemonName.rawValue)
        defaults.set(choosenNumber, forKey: Statics.pokemonNumber.rawValue)
        defaults.set(firstChoose, forKey: Statics.firstChoose.rawValue)
        defaults.set(evolutionNumber, forKey: Statics.evolutionNumber.rawValue)
        defaults.set(pokemon, forKey: Statics.pokemon.rawValue)
        defaults.set(score, forKey: Statics.score.rawValue)
    }
    func changeUI() {
        nameTextField.text = username
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
        choosenName = pokemons[row].firstEvolution.name
        choosenNumber = pokemons[row].firstEvolution.number
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

extension UIImageView {
    func loadFrom(urlAdress: String) {
        guard let url = URL(string: urlAdress) else { return }
        
        DispatchQueue.main.async {
    
            print(" Thread current: \(Thread.current)")
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self.image = loadedImage
                }
            }
        }
    }
}

extension UIViewController {
    func setGradientBackground(colorTop: CGColor, colorBottom: CGColor) {
        //        let colorTop =  UIColor(red: 57.0/255.0, green: 174.0/255.0, blue: 169/255.0, alpha: 1.0).cgColor
        //        let colorBottom = UIColor(red: 162.0/255.0, green: 213.0/255.0, blue: 171.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

extension UIViewController {
    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    /// Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
