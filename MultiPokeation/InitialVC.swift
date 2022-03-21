//
//  ViewController.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 21/03/2022.
//

import UIKit

class InitialVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
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
