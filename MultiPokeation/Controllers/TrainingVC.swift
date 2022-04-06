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
    @IBOutlet weak var checkButtonBottomConstraint: NSLayoutConstraint!
    
    var score = 0
    var questionCounter = 1
    var correctCounter = 0
    var correctAnser: Int?
    var userAnswer: Int?
    
    var pokemonName = ""
    var pokemonNumber = 0
    var pokemon = 0
    var evolutionNumber: Int = 1
    var level = [2, 4, 7, 10]
    
    var numberOne: Int?
    var numberTwo: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettings()
        changeUI()
        addObservers()
        setupHideKeyboardOnTap()
        quest()
    }
    
    @IBAction func didTapCheckButton(_ sender: UIButton) {
        if answetTextField.text?.isEmpty == false {
            checkAnswer()
            progressView.setProgress(Float(score)/100, animated: true)
        }
    }
    
    @IBAction func didTapQuitTrainingButton(_ sender: UIButton) {
        performSegue(withIdentifier: "sequeTrainingVCToMainVC", sender: .none)
        saveSettings()
    }
    
    func changeUI() {
        progressView.setProgress(Float(score)/100, animated: true)
        setGradientBackground(colorTop: UIColor(red: 21/255, green: 114/255, blue: 161/255, alpha: 1).cgColor, colorBottom: UIColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1).cgColor)
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
            correctCounter += 1
            correctAlert()
            score += 12
        } else {
            wrongAlert()
            if score >= 7 {
                score -= 7
            } else {
                score = 0
            }
        }
        answetTextField.text = nil
    }
    
    func correctAlert() {
        let alert = UIAlertController(title: "Good!😃", message: "+12 Points" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Next quest", style: .default) { (_) in
            if self.checkEvolution() == false {
            self.endTraining()
            }
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func wrongAlert() {
        var title = ""
        var message = ""
        if score >= 7 {
            title = "Wrong..😐"
            message = "-7 points"
        } else {
            title = "Wrong answer"
            message = "Try again 😉"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Next quest", style: .default) { (_) in
            self.endTraining()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func summaryAlert() {
        let alert = UIAlertController(title: "Take a rest!", message: "Correct answers: \(correctCounter) / 10", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.performSegue(withIdentifier: "sequeTrainingVCToMainVC", sender: nil)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    func checkEvolution() -> Bool {
        if score >= 100 && evolutionNumber < 3 {
            evolutionNumber += 1
            if evolutionNumber == 2 {
                pokemonName = pokemons[Int(pokemon) ].secondEvolution.name
                pokemonNumber = pokemons[Int(pokemon) ].secondEvolution.number
            } else  {
                pokemonName = pokemons[Int(pokemon) ].thirdEvolution.name
                pokemonNumber = pokemons[Int(pokemon) ].thirdEvolution.number
            }
            score = 0
            questionCounter = 1
            saveSettings()
            performSegue(withIdentifier: "segueFromTrainingVCToEvolutionVC", sender: .none)
            return true
        }  else if score >= 100 && evolutionNumber == 3 {
            performSegue(withIdentifier: "segueFromTrainingVCToSummaryVC", sender: .none)
            saveSettings()
            return true
        } else {
            return false
        }
    }
    
    func endTraining() {
        if questionCounter < 10 {
            questionCounter += 1
            questNumberLabel.text = ("\(questionCounter)")
            quest()
            self.answetTextField.becomeFirstResponder()
        } else {
            saveSettings()
            summaryAlert()
        }
    }
    
    func loadSettings() {
        evolutionNumber = UserDefaults.standard.integer(forKey: "evolutionNumber")
        score = UserDefaults.standard.integer(forKey: "score")
        pokemonName = UserDefaults.standard.string(forKey: S.pokemonName) ?? "Error"
        pokemonNumber = UserDefaults.standard.integer(forKey: S.pokemonNumber)
        pokemon = UserDefaults.standard.integer(forKey: S.pokemon)
    }
    
    func saveSettings() {
        UserDefaults.standard.set(score, forKey: "score")
        UserDefaults.standard.set(evolutionNumber, forKey: "evolutionNumber")
        UserDefaults.standard.set(pokemonName, forKey: S.pokemonName)
        UserDefaults.standard.set(pokemonNumber, forKey: S.pokemonNumber)
    }
    
    func addObservers() {
        // Subscribe to Keyboard Will Show notifications
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        // Subscribe to Keyboard Will Hide notifications
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc dynamic func keyboardWillShow(_ notification: NSNotification) {
        animateWithKeyboard(notification: notification) { keyboardFrame in
            let constant = keyboardFrame.height - 20
            self.checkButtonBottomConstraint.constant = constant
        }
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        animateWithKeyboard(notification: notification) { keyboardframe in
            self.checkButtonBottomConstraint.constant = 0
        }
    }
    
}

extension TrainingVC {
    func animateWithKeyboard(
        notification: NSNotification,
        animations: ((_ keyboardFrame: CGRect) -> Void)?
    ) {
        // Extract the duration of the keyboard animation
        let durationKey = UIResponder.keyboardAnimationDurationUserInfoKey
        let duration = notification.userInfo![durationKey] as! Double
        
        // Extract the final frame of the keyboard
        let frameKey = UIResponder.keyboardFrameEndUserInfoKey
        let keyboardFrameValue = notification.userInfo![frameKey] as! NSValue
        
        // Extract the curve of the iOS keyboard animation
        let curveKey = UIResponder.keyboardAnimationCurveUserInfoKey
        let curveValue = notification.userInfo![curveKey] as! Int
        let curve = UIView.AnimationCurve(rawValue: curveValue)!
        
        // Create a property animator to manage the animation
        let animator = UIViewPropertyAnimator(
            duration: duration,
            curve: curve
        ) {
            // Perform the necessary animation layout updates
            animations?(keyboardFrameValue.cgRectValue)
            
            // Required to trigger NSLayoutConstraint changes
            // to animate
            self.view?.layoutIfNeeded()
        }
        // Start the animation
        animator.startAnimation()
    }
}

