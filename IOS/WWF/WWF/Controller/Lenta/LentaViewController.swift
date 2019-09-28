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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        setCornersButton()
        Constant.Lenta.controller = self
    }
    
    @IBAction func openProject(_ sender: UIButton) {
        page = .proj
        tableView.reloadData()
        projectButton.titleLabel!.textColor = UIColor.white
        fondButton.titleLabel!.textColor = UIColor.black
        newsButton.titleLabel!.textColor = UIColor.black
    }
    
    
    @IBAction func openFond(_ sender: UIButton) {
        page = .fond
        projectButton.titleLabel!.textColor = UIColor.black
        fondButton.titleLabel!.textColor = UIColor.white
        newsButton.titleLabel!.textColor = UIColor.black
        tableView.reloadData()
    }
    
    @IBAction func openNews(_ sender: UIButton) {
        page = .news
        tableView.reloadData()
        projectButton.titleLabel!.textColor = UIColor.black
        fondButton.titleLabel!.textColor = UIColor.black
        newsButton.titleLabel!.textColor = UIColor.white
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
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch page{
        case .proj:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell") as! ProjectTableViewCell
            
            cell.update(image: UIImage(named: "facebook")!, name: "Save me please", description: "Save me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me please")
            return cell
        case .fond:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FondAndNewsCell") as! FondAndNewsTableViewCell
            
            cell.update(image: UIImage(named: "facebook")!, name: "Save me please", description: "Save me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me pleaseSave me please")
            return cell
        case .news:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FondAndNewsCell") as! FondAndNewsTableViewCell
            
            cell.update(image: UIImage(named: "facebook")!, name: "Тигр убил ребенка", description: "Тигр из Африки убил черного ребенка. общество борьбы за права чернокжих, считает, что это было открытое проявление ненавести к чернокожим")
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
}
