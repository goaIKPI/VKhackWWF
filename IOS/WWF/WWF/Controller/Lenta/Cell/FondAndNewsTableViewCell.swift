//
//  FondAndNewsTableViewCell.swift
//  WWF
//
//  Created by Олег Герман on 28/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class FondAndNewsTableViewCell: UITableViewCell {
    @IBOutlet private weak var imageFond: UIImageView!
    @IBOutlet private weak var nameFond: UILabel!
    @IBOutlet private weak var descriptionFond: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(image: UIImage, name: String, description: String) {
        self.imageFond.image = image
        self.nameFond.text = name
        self.descriptionFond.text = description
    }
    
}
