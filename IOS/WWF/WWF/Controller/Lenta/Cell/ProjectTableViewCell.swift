//
//  ProjectTableViewCell.swift
//  WWF
//
//  Created by Олег Герман on 28/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet private weak var imageProj: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var descriptionProj: UILabel!
    @IBOutlet private weak var buttonDescription: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonDescription.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    @IBAction func openProject(_ sender: UIButton) {
//        Constant.Lenta.controller?.presentProject()
//    }
    
    func update(image: String, name: String, description: String) {
        self.imageProj.downloaded(from: image)
        self.name.text = name
        self.descriptionProj.text = description
    }
    
}
