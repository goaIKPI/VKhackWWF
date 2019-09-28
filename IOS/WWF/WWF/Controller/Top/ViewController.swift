//
//  ViewController.swift
//  WWF
//
//  Created by Олег Герман on 27/09/2019.
//  Copyright © 2019 Олег Герман. All rights reserved.
//

import UIKit
import SwiftyVK

class ViewController: UIViewController, SwiftyVKDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonConfirm: UIButton!
    private var selectCount = 0
    @IBOutlet weak var textConfirm: UILabel!
    
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
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    

//    @IBAction func click(_ sender: UIButton) {
//
//
//        VK.sessions.default.logIn(
//            onSuccess: { _ in
//                // Start working with SwiftyVK session here
//        },
//            onError: { _ in
//                // Handle an error if something went wrong
//        }
//        )
//    }
    
    @IBAction func selectTop(_ sender: UIButton) {
        performSegue(withIdentifier: "presentTabBarToTop", sender: nil)
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopDestCell", for: indexPath) as! TopDestCollectionViewCell
        
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.clipsToBounds = true


        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 1
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.clipsToBounds = false
        
        
        cell.update(image: UIImage(named: "facebook")!, text: "Дикая природа")
        
        
        return cell

    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCount = (collectionView.cellForItem(at: indexPath) as! TopDestCollectionViewCell).selectItem(selectCount)
        
        textConfirm.text = "Выбрать (\(selectCount))"
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  15
        let collectionViewSizeWidth = collectionView.frame.size.width - padding
        let collectionViewSizeHeight = collectionView.frame.size.height - 3*padding
        return CGSize(width: collectionViewSizeWidth/2, height: collectionViewSizeHeight/3)
    }
    
}
