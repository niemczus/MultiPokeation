//
//  PokemonCell.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 02/04/2022.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
    }
    
    func populate(number: Int, name: String ) {
        pokemonNameLabel.layer.masksToBounds = true
        pokemonNameLabel.layer.cornerRadius = 10
        let pokemonImage = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(number).png")
        pokemonImageView.kf.setImage(with: pokemonImage)
        pokemonNameLabel.text = name
    }
}
