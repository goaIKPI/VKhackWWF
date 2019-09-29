//
//  AuthViewController.swift
//  WWF
//
//  Created by Олег Герман on 28/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit
import SwiftyVK

class AuthViewController: UIViewController, SwiftyVKDelegate {
    var info: [String: String]?
    @IBOutlet weak var buttonAuth: UIButton!
     var isSuc = false
    
    
    func vkNeedsScopes(for sessionId: String) -> Scopes {
        // Called when SwiftyVK attempts to get access to user account
        // Should return a set of permission scopes
        let scopes = Scopes.email
        return scopes
    }
    
    func vkNeedToPresent(viewController: VKViewController) {
        self.present(viewController, animated: true)
        // Called when SwiftyVK wants to present UI (e.g. webView or captcha)
        // Should display given view controller from current top view controller
    }
    
    func vkTokenCreated(for sessionId: String, info: [String : String]) {
        print(info)
        self.info = info
        // Called when user grants access and SwiftyVK gets new session token
        // Can be used to run SwiftyVK requests and save session data
    }
    
    func vkTokenUpdated(for sessionId: String, info: [String : String]) {
        // Called when existing session token has expired and successfully refreshed
        // You don't need to do anything special here
    }
    
    func vkTokenRemoved(for sessionId: String) {
        // Called when user was logged out
        // Use this method to cancel all SwiftyVK requests and remove session data
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VK.setUp(appId: "7150700", delegate: self)
        buttonAuth.layer.cornerRadius = buttonAuth.frame.size.height / 2
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func auth(_ sender: Any) {
        VK.sessions.default.logIn(
                    onSuccess: { _ in
                        
                        self.auth(userId: self.info!["user_id"]!)
                        while self.isSuc {
                            
                        }
                        Constant.User.info = self.info
                        self.performSegue(withIdentifier: "presentTopToAuth", sender: nil)
                        
                        // Start working with SwiftyVK session here
                },
                    onError: { _ in
                        
                        if self.info != nil{
                    
                            self.auth(userId: self.info!["user_id"]!)
                            while self.isSuc {
                                
                            }
                            Constant.User.info = self.info
                            self.performSegue(withIdentifier: "presentTabBarToAuth", sender: nil)
                        }
                        
                        
                        // Handle an error if something went wrong
                }
                )
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func auth(userId: String){
        let url = URL(string: "https://bc86ceb8.ngrok.io/auth/vkauth")!
       
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "user_id": userId
        ]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data,
                let _ = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                    print("error", error ?? "Unknown error")
                    return
            }
            print(data)
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            do {
                let array = try JSONSerialization.jsonObject(with: data) as? [String : Any]
                self.isSuc = true
            } catch {
                print("Exception occured \(error))")
            }
            if error == nil {
                
            } else {
                self.showAlert(text: "Произошла ошибка")
            }
        }
        
        task.resume()
       
        
    }
    
    
    private func getLove(id: String) {
        
        //create the url with NSURL
        let url = URL(string: "https://bc86ceb8.ngrok.io/user/favorites/\(id)")! //change the url
        
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
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }
    
    
    
    func showAlert(text: String){
        let alert = UIAlertController(title: text, message: "", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}


extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
