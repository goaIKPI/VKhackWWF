//
//  LentaViewController.swift
//  WWF
//
//  Created by Олег Герман on 28/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit

enum Page {
    case proj
    case fond
    case news
}

class LentaViewController: UIViewController {
    @IBOutlet weak var projectButton: UIButton!
    @IBOutlet weak var fondButton: UIButton!
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    private var page = Page.proj
    private var project: [[String:Any]]? = nil
    private var fond: [[String:Any]]? = nil
    private var news: [[String:Any]]? = nil
    private var isSuc: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProject()
        getFond()
        getNews()
        setCornersButton()
        Constant.Lenta.controller = self
    }
    
    @IBAction func openProject(_ sender: UIButton) {
        page = .proj
        tableView.reloadData()
        projectButton.titleLabel!.textColor = UIColor.white
        fondButton.titleLabel!.textColor = UIColor.black
        newsButton.titleLabel!.textColor = UIColor.black
        
        projectButton.backgroundColor = UIColor(red: 1/255, green: 150/255, blue: 86/255, alpha: 1)
        fondButton.backgroundColor = UIColor.clear
        newsButton.backgroundColor = UIColor.clear
    }
    
    
    @IBAction func openFond(_ sender: UIButton) {
        page = .fond
        projectButton.titleLabel!.textColor = UIColor.black
        fondButton.titleLabel!.textColor = UIColor.white
        newsButton.titleLabel!.textColor = UIColor.black
        
        projectButton.backgroundColor = UIColor.clear
        fondButton.backgroundColor = UIColor(red: 1/255, green: 150/255, blue: 86/255, alpha: 1)
        newsButton.backgroundColor = UIColor.clear
        tableView.reloadData()
    }
    
    @IBAction func openNews(_ sender: UIButton) {
        page = .news
        tableView.reloadData()
        projectButton.titleLabel!.textColor = UIColor.black
        fondButton.titleLabel!.textColor = UIColor.black
        newsButton.titleLabel!.textColor = UIColor.white
        
        projectButton.backgroundColor = UIColor.clear
        fondButton.backgroundColor = UIColor.clear
        newsButton.backgroundColor = UIColor(red: 1/255, green: 150/255, blue: 86/255, alpha: 1)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func presentProject() {
        performSegue(withIdentifier: "presentProjectToLenta", sender: nil)
    }

}


extension LentaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch page{
        case .proj:
            performSegue(withIdentifier: "presentProjectToLenta", sender: nil)
        case .fond:
            performSegue(withIdentifier: "presentFondToLenta", sender: nil)
        case .news:
            performSegue(withIdentifier: "presentNewsToLenta", sender: nil)
        default:
            print("error to delegate")
        }
        
    }
}

extension LentaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch page{
        case .proj:
            return project!.count
        case .fond:
            return fond!.count
        case .news:
            return news!.count
        default:
            print("error to dataSource")
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch page{
        case .proj:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell") as! ProjectTableViewCell
            cell.update(image: "https://bc86ceb8.ngrok.io/media/\(project![indexPath.row]["photo_id"]!)" , name: project![indexPath.row]["name"] as! String, description: project![indexPath.row]["name"] as! String)
            return cell
        case .fond:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FondAndNewsCell") as! FondAndNewsTableViewCell
            print("https://bc86ceb8.ngrok.io/media/\(fond![indexPath.row]["photo_id"]!)")
            cell.update(image:"https://bc86ceb8.ngrok.io/media/\(fond![indexPath.row]["photo_id"]!)" , name: fond![indexPath.row]["name"] as! String, description: fond![indexPath.row]["short_description"] as! String )
            return cell
        case .news:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FondAndNewsCell") as! FondAndNewsTableViewCell
            
            cell.update(image: "https://bc86ceb8.ngrok.io/media/\(news![indexPath.row]["photo_id"]!)" , name: news![indexPath.row]["name"] as! String, description: news![indexPath.row]["short_description"] as! String )
            return cell
        default:
            print("error to dataSource")
        }
        
        
        
        
    }
    
    
}

private extension LentaViewController {
    func setCornersButton(){
        projectButton.layer.cornerRadius = projectButton.frame.size.height/2
        fondButton.layer.cornerRadius = fondButton.frame.size.height/2
        newsButton.layer.cornerRadius = newsButton.frame.size.height/2
    }
    
    private func getProject() {
        
        //create the url with NSURL
        let url = URL(string: "https://bc86ceb8.ngrok.io/project/")! //change the url
        
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
            let responseString = String(data: data, encoding: .utf8)
            print(responseString)
            do {
                //create json object from data
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.project = json["data"] as? [[String:Any]]
                print(self.project![0]["name"])
                DispatchQueue.main.async {
                    self.tableView.dataSource = self
                    self.tableView.delegate = self
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error.localizedDescription)
                self.isSuc = true
            }
        })
        task.resume()
        
    }
    
    
    
    private func getFond() {
        
        //create the url with NSURL
        let url = URL(string: "https://bc86ceb8.ngrok.io/organization/")! //change the url
        
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
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
                self.fond = json as? [[String:Any]]
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }
    
    
    private func getNews() {
        
        //create the url with NSURL
        let url = URL(string: "https://bc86ceb8.ngrok.io/news/")! //change the url
        
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
                self.news = json["data"] as? [[String:Any]]
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }
    
    
    
    
    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill ) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
