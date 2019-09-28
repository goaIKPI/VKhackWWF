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
                        self.performSegue(withIdentifier: "presentTopToAuth", sender: nil)
                        // Start working with SwiftyVK session here
                },
                    onError: { _ in
                        if self.info != nil{
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

}
