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
    
    var score = 0
    var questionCounter = 1
    var correctAnser: Int?
    var userAnswer: Int?
    
    var evolutionNumber: Int = 1
    var level = [2, 4, 7, 10]
    
    var numberOne: Int?
    var numberTwo: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
        progressView.setProgress(Float(score)/100, animated: true)
        setupHideKeyboardOnTap()
        setGradientBackground()
        quest()
    }
    
    @IBAction func didTapCheckButton(_ sender: UIButton) {
        checkAnswer()
        print(score)
        progressView.setProgress(Float(score)/100, animated: true)
        print(progressView.progress)
        checkEvolution()
        endTraining()
    }
    
    @IBAction func didTapQuitTrainingButton(_ sender: UIButton) {
        performSegue(withIdentifier: "sequeTrainingVCToMainVC", sender: .none)
        saveSettings()
    }
    func quest() {
        let first = Int.random(in: 2...level[evolutionNumber])
        let second = Int.random(in: 2...level[evolutionNumber])
        numberOneLabel.text = String("\(first)")
        numberTwoLabel.text = String("\(second)")
        correctAnser = first * second
    }
    
    func checkAnswer() {
        userAnswer = Int(answetTextField.text!) ?? 0
        if userAnswer == correctAnser {
            correctAlert()
            score += 5
        } else {
            if score >= 3 {
            wrongAlert()
            score -= 3
            }
        }
        
        answetTextField.text = nil
    }
    
    func correctAlert() {
        let alert = UIAlertController(title: "Correct 🥳", message: "+5 points to evolution", preferredStyle: .alert)
        let action = UIAlertAction(title: "Next quest", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func wrongAlert() {
        let alert = UIAlertController(title: "Upps.. wrong 🤤", message: "-3 points to evolution", preferredStyle: .alert)
        let action = UIAlertAction(title: "Next quest", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func checkEvolution() {
        if score >= 100 {
            print("evolution")
            //segue to evolution scree?
        }
    }
    func endTraining() {
        questionCounter += 1
        questNumberLabel.text = ("\(questionCounter)")
        if questionCounter < 10 {
            quest()
        } else {
            saveSettings()
            performSegue(withIdentifier: "sequeToMainVC", sender: nil) }
    }
    
    
    func loadSettings() {
        evolutionNumber = UserDefaults.standard.integer(forKey: "evolutionNumber")
        score = UserDefaults.standard.integer(forKey: "score")
    }
    
    func saveSettings() {
        UserDefaults.standard.set(score, forKey: "score")
    }
    
}
