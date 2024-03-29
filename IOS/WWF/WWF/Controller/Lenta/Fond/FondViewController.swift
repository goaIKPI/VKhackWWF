//
//  FondViewController.swift
//  WWF
//
//  Created by Олег Герман on 28/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class FondViewController: UIViewController {

    @IBOutlet weak var buttonNews: UIButton!
    @IBOutlet weak var buttonProject: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonNews.layer.cornerRadius = buttonNews.layer.frame.size.height/2
        buttonProject.layer.cornerRadius = buttonProject.layer.frame.size.height/2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func presentAllNEws(_ sender: Any) {
        performSegue(withIdentifier: "presentAllNewsToFond", sender: nil)
    }
    
    
    @IBAction func presentAllProject(_ sender: Any) {
        performSegue(withIdentifier: "presentAllProjectToFond", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
