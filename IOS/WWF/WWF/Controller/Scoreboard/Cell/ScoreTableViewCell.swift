//
//  ScoreTableViewCell.swift
//  WWF
//
//  Created by Олег Герман on 29/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var imageScore: UIImageView!
    @IBOutlet weak var nomer: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func update(name: String, image: String, score: String, nomer: Int) {
        self.name.text = name
        self.imageScore.downloaded(from: image)
        self.score.text = score
        self.nomer.text = String(nomer)
    }
}
