//
//  Alerts.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 14/04/2022.
//

import Foundation
import UIKit

extension TrainingVC {
    func correctAlert() {
        let alert = UIAlertController(title: "Good!😃", message: "+\(plusValue) Points" , preferredStyle: .alert)
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
        if score >= minusValue {
            title = "Wrong..😐"
            message = "-\(minusValue) points"
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
}

extension MainVC {
    func restartAlert() {
        let alert = UIAlertController(title: "You fully trained \(pokemonName)", message: .none, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Train another", style: .default) { (_) in
            Settings.shared.evolutionNumber = 1
            Settings.shared.score = 0
            self.performSegue(withIdentifier: "fromMainVCToInitialVC", sender: .none)
        }
        alert.addAction(action)
        present(alert, animated: true)
        }
}
