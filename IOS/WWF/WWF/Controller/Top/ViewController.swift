//
//  ViewController.swift
//  WWF
//
//  Created by Олег Герман on 27/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonConfirm: UIButton!
    private var selectCount = 0
    @IBOutlet weak var textConfirm: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        textConfirm.layer.cornerRadius = 20
        textConfirm.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textConfirm.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    
    @IBAction func selectTop(_ sender: UIButton) {
        performSegue(withIdentifier: "presentTabBarToTop", sender: nil)
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopDestCell", for: indexPath) as! TopDestCollectionViewCell
        
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.clipsToBounds = true


        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 1
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.clipsToBounds = false
        
        
        cell.update(image: UIImage(named: "facebook")!, text: "Дикая природа")
        
        
        return cell

    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCount = (collectionView.cellForItem(at: indexPath) as! TopDestCollectionViewCell).selectItem(selectCount)
        
        textConfirm.text = "Выбрать (\(selectCount))"
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  15
        let collectionViewSizeWidth = collectionView.frame.size.width - padding
        let collectionViewSizeHeight = collectionView.frame.size.height - 3*padding
        return CGSize(width: collectionViewSizeWidth/2, height: collectionViewSizeHeight/3)
    }
    
}
