//
//  ViewController.swift
//  F21-Week4Project
//
//  Created by Rania Arbash on 2021-10-01.
//

import UIKit

class ViewController: UIViewController ,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
    
    @IBOutlet weak var name_text: UITextField!
    @IBOutlet weak var number_text: UITextField!
    
    @IBOutlet weak var myContactTable: UITableView!
    var contacts = [Contact]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        print(indexPath.row)
        cell.textLabel?.text = contacts[indexPath.row].name
            
        cell.detailTextLabel?.text = contacts[indexPath.row].number
        return cell
        
    }

    @IBAction func addNewContact(_ sender: Any) {
        if let correctNumber = self.number_text.text{
            if let correctName = self.name_text.text {
                
            let alert = UIAlertController(title: "Adding New Contact!!", message: "Are you sure you want to add \(correctName) to your contacts??", preferredStyle: .alert)
        
            let action = UIAlertAction(title: "Yes", style: .default) { action in
                
                        let newContact = Contact(n: correctName, num: correctNumber)
                        self.contacts.append(newContact)
                        self.myContactTable.reloadData()
                
                self.name_text.text = ""
                self.number_text.text = ""
            }
            
            let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            
            
            alert.addAction(action)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
            
        }
       
    }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print ("Contact Name: \(contacts[indexPath.row].name)" )
    }
    
// confirm a protocole in swift = implement an interface in java or c++
    @IBOutlet weak var mytabel: UITableView!
    @IBOutlet weak var mybutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

