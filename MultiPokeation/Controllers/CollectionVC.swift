//
//  CollectionVC.swift
//  MultiPokeation
//
//  Created by Kamil Niemczyk on 01/04/2022.
//

import UIKit

class CollectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        changeUI()
    }
    
    @IBAction func didTapBinButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete all your collection?", message: .none, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            Settings.shared.collectionNames.removeAll()
            Settings.shared.collectionImages.removeAll()
            self.collectionView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func changeUI() {
        setGradientBackground(colorTop: CGColor(red: 156/255, green: 15/255, blue: 72/255, alpha: 1), colorBottom: CGColor(red: 162/255, green: 213/255, blue: 171/255, alpha: 1))
    }
}

extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Settings.shared.collectionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCell else { return UICollectionViewCell() }
        DispatchQueue.main.async {
            cell.populate(number: Settings.shared.collectionImages[indexPath.item], name: Settings.shared.collectionNames[indexPath.item])
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
