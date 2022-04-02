//
//  CollectionVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 01/04/2022.
//

import UIKit

class CollectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionImages = Array<Int>()
    var collectionNames: Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
        collectionView.delegate = self
        collectionView.dataSource = self
        setGradientBackground(colorTop: CGColor(red: 33/255, green: 66/255, blue: 82/255, alpha: 1), colorBottom: CGColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1))
//        collectionImages.append(12)
//        collectionImages.append(34)
//        collectionImages.append(78)
//        collectionImages.append(72)
//        collectionImages.append(70)
//        collectionImages.append(93)
//        collectionImages.append(93)
//        collectionImages.append(93)
//        collectionImages.append(93)
//        collectionImages.append(93)
//        collectionImages.append(93)

    }
    
    func loadSettings() {
        collectionImages = (UserDefaults.standard.array(forKey: S.collectionImages) as? Array<Int>) ?? [Int]()
        collectionNames = (UserDefaults.standard.array(forKey: S.collectionNames) as? Array<String>) ?? [String]()
    }
}

extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCell else { return UICollectionViewCell() }
        cell.populate(number: collectionImages[indexPath.item], name: collectionNames?[indexPath.item] ?? "Pokemon")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 180
        let width = (collectionView.frame.width / 2) - 10
        let size = CGSize(width: width, height: height)
        return size
    }
}
