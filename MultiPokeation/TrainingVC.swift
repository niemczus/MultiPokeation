//
//  TrainingVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 28/03/2022.
//

import UIKit

class TrainingVC: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questNumberLabel: UILabel!
    @IBOutlet weak var numberOneLabel: UILabel!
    @IBOutlet weak var numberTwoLabel: UILabel!
    @IBOutlet weak var answetTextField: UITextField!
    
    var score: Float = 0
    var questionCounter = 1
    var correctAnser: Int?
    var userAnswer: Int?
    
    var pokemonEvolution: Int = 1
    var level = [2, 4, 7, 10]
    
    var numberOne: Int?
    var numberTwo: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
        setupHideKeyboardOnTap()
        setGradientBackground()
        quest()
    }
    
    @IBAction func didTapCheckButton(_ sender: UIButton) {
        checkAnswer()
        checkEvolution()
        endTraining()
    }
    
    func quest() {
        let first = Int.random(in: 2...level[pokemonEvolution])
        let second = Int.random(in: 2...level[pokemonEvolution])
        numberOneLabel.text = String("\(first)")
        numberTwoLabel.text = String("\(second)")
        correctAnser = first * second
    }
    
    func checkAnswer() {
        if userAnswer == correctAnser {
            score += 0.05
        } else if score >= 0.03 {
            score -= 0.03
        }
        progressView.progress = score
        answetTextField.text = nil
    }
    
    func checkEvolution() {
        if score >= 100 {
            print("evolution")
            //segue to evolution scree?
        }
    }
    func endTraining() {
        questionCounter += 1
        if questionCounter < 10 {
            quest()
        } else { performSegue(withIdentifier: "sequeToMainVC", sender: nil) }
    }
    
    
    func loadSettings() {
        guard
            let settings = UserDefaults.standard.dictionary(forKey: "settings"),
            let pokemonEvolution = settings["pokemonEvolution"] as? Int
        else { print("failed"); return }
        self.pokemonEvolution = pokemonEvolution
    }
}
