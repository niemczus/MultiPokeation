//
//  MainVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 26/03/2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var username = "None"
    var pokemonName = "None"
    var evolutionNumber = 1
    var pokemonNumber = 0
    var score = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettings()
        changeUI()
    }
    
    @IBAction func didTapRestartButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "You lose \(pokemonName) training progress ", message: .none, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { (_) in
            self.performSegue(withIdentifier: "fromMainVCToInitialVC", sender: .none)
        }
        let backAction = UIAlertAction(title: "Back", style: .default)
        alert.addAction(confirmAction)
        alert.addAction(backAction)
        present(alert, animated: true)
    }
    
    @IBAction func didTapStartTraining(_ sender: UIButton) {
        if evolutionNumber == 3 && score >= 100 {
            restartAlert()
        } else {
            performSegue(withIdentifier: "fromMainVCToTrainingVC", sender: .none)
        }
    }
    
   func loadSettings() {
       username = UserDefaults.standard.string(forKey: "username") ?? "Error"
       pokemonName = UserDefaults.standard.string(forKey: "pokemonName") ?? "Error"
       evolutionNumber = UserDefaults.standard.integer(forKey: "evolutionNumber")
       pokemonNumber = UserDefaults.standard.integer(forKey: "pokemonNumber")
       score = UserDefaults.standard.integer(forKey: "score")
    }
    
    func changeUI() {
        nameLabel.text = username
        pokemonLabel.text = pokemonName
        evolutionLabel.text = "Evolution \(evolutionNumber)"
        pokemonImageView.loadFrom(urlAdress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
        scoreLabel.text = "Score: \(String(score < 100 ? score : 100))"
        progressView.setProgress(Float(score)/100, animated: true)
        setGradientBackground(colorTop: UIColor(red: 83/255, green: 62/255, blue: 133/255, alpha: 1).cgColor, colorBottom: UIColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1).cgColor)
    }
    
    func restartAlert() {
        let alert = UIAlertController(title: "You fully trained \(pokemonName)", message: .none, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Train another", style: .default) { (_) in
            self.performSegue(withIdentifier: "fromMainVCToInitialVC", sender: .none)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}



