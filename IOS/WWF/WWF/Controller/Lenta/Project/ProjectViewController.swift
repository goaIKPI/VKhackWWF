//
//  ProjectViewController.swift
//  WWF
//
//  Created by Олег Герман on 28/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonPurchase: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var buttonfield: UITextField!
    @IBOutlet weak var buttonList: UIButton!
    @IBOutlet weak var buttonOpen: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var chel: UILabel!
    @IBOutlet weak var sucProblems: UILabel!
    @IBOutlet weak var sucProbl: UILabel!
    
    private var project = Constant.Lenta.Project
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomConstraint.constant = 500
        buttonPurchase.layer.cornerRadius = buttonPurchase.frame.size.height/2
        button1.layer.cornerRadius = button1.frame.size.height/2
        button2.layer.cornerRadius = button2.frame.size.height/2
        button3.layer.cornerRadius = button3.frame.size.height/2
        button4.layer.cornerRadius = button4.frame.size.height/2
        buttonfield.layer.cornerRadius = buttonfield.frame.size.height/2
         buttonList.layer.cornerRadius = buttonList.frame.size.height/2
        buttonOpen.layer.cornerRadius = 20
        buttonOpen.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        buttonOpen.clipsToBounds = true
        print(project!["photo_id"])
        imageView.downloaded(from: "https://bc86ceb8.ngrok.io/media/\(project!["photo_id"]!)")
        name.text = project!["name"] as? String
        sucProbl.text = project!["description"] as? String
        sucProblems.text = project!["solution_description"] as? String
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        let width = self.view.frame.size.width * CGFloat(progressView.progress)
        progressLabel.frame.size.width = width
    }
    
    override func viewWillLayoutSubviews() {
        let width = self.view.frame.size.width * CGFloat(progressView.progress)
        progressLabel.frame.size.width = width
    }
    
    @IBAction func backs(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openWindowDonat(_ sender: Any) {
        UIView.animate(withDuration: 1){
            self.bottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
    
    }
    @IBAction func closeWindowDonat(_ sender: Any) {
        UIView.animate(withDuration: 1){
            self.bottomConstraint.constant = 500
            self.view.layoutIfNeeded()
        }
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
