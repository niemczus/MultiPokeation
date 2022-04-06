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
        changeUI()
    }
    
    @IBAction func didTapBinButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete all your collection?", message: .none, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            self.collectionImages.removeAll()
            self.collectionNames?.removeAll()
            UserDefaults.standard.set(self.collectionImages, forKey: S.collectionImages)
            UserDefaults.standard.set(self.collectionNames, forKey: S.collectionNames)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func changeUI() {
        setGradientBackground(colorTop: CGColor(red: 156/255, green: 15/255, blue: 72/255, alpha: 1), colorBottom: CGColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1))
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
        DispatchQueue.main.async {
            cell.populate(number: self.collectionImages[indexPath.item], name: self.collectionNames?[indexPath.item] ?? "Pokemon")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 180
        let width = (collectionView.frame.width / 2) - 10
        let size = CGSize(width: width, height: height)
        return size
    }
}
