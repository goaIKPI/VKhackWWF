//
//  TopDestCollectionViewCell.swift
//  WWF
//
//  Created by Олег Герман on 28/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class TopDestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var select: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        select.image = UIImage(named: "facebook")
        select.isHidden = true
    }
    
    func update(image: UIImage, text: String){
        self.image.image = image
        self.text.text = text
    }
    
    func selectItem(_ count: Int) -> Int{
        if select.isHidden {
            select.isHidden = false
            return count + 1
        } else {
            select.isHidden = true
            return count - 1
        }
        
    }
}
