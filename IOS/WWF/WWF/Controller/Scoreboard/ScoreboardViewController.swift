//
//  ScoreboardViewController.swift
//  WWF
//
//  Created by Олег Герман on 29/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var user: [[String: Any]]? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
         self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getUsers(){
        //create the url with NSURL
        let url = URL(string: "https://bc86ceb8.ngrok.io/user/scoreboard")! //change the url
        
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
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                self.user = json
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }

}


extension ScoreboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if user != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell") as! ScoreTableViewCell
            cell.update(name: user![indexPath.row]["username"] as! String,
                        image: user![indexPath.row]["profile_pic_path"] as! String,
                        score: String(user![indexPath.row]["rating"] as! Int),
                        nomer: indexPath.row + 1)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell") as! ScoreTableViewCell
        return cell
    }
    
    
}
