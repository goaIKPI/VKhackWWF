//
//  LKViewController.swift
//  WWF
//
//  Created by Олег Герман on 29/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class LKViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    private var user:[String: Any]? = nil
    @IBOutlet weak var raiting: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressBare: ProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        // Do any additional setup after loading the view.
    }
    

    
    func getUser(){
        //create the url with NSURL
        let url = URL(string: "https://bc86ceb8.ngrok.io/user/\(Constant.User.info!["user_id"]!)")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.user = json
                DispatchQueue.main.async {
                    self.name.text = self.user!["username"] as? String
                    self.imageView.downloaded(from: self.user!["profile_pic_path"] as! String)
                    self.raiting.text = "Место в рейтинге: 2"
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
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
