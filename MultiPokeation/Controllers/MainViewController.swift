//
//  MainVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 26/03/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var username = Settings.shared.username
    var pokemonName = Settings.shared.pokemonName
    var evolutionNumber = Settings.shared.evolutionNumber
    var pokemonNumber = Settings.shared.pokemonNumber
    var score = Settings.shared.score
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    @IBAction func didTapRestartButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "You lose \(pokemonName) training progress ",
                                      message: .none,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { (_) in
            Settings.shared.evolutionNumber = 1
            Settings.shared.score = 0
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
    
    func setupViews() {
        nameLabel.text = username
        pokemonLabel.text = pokemonName
        evolutionLabel.text = "Evolution \(evolutionNumber)"
        let pokemonImage = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonNumber).png")
        pokemonImageView.kf.setImage(with: pokemonImage)
        scoreLabel.text = "Score: \(String(score < 100 ? score : 100))"
        progressView.setProgress(Float(score)/100, animated: true)
        setGradientBackground(colorTop: UIColor(red: 83/255, green: 62/255, blue: 133/255, alpha: 1).cgColor,
                              colorBottom: UIColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1).cgColor)
    }
}

