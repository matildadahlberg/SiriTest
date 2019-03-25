//
//  ViewController.swift
//  Siri
//
//  Created by Matilda Dahlberg on 2019-03-18.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import UIKit
import os
import Intents
import AVFoundation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var list : [String] = Shared.cache.lightState
    
    var list:[(name:String,checked:Bool)] = [(name: Shared.cache.list ,checked: Shared.cache.lightState)]
    
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    
    
    var pressed = Bool()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(list)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pressed = Shared.cache.lightState
        
//        switchOutlet.isOn = Shared.cache.lightState
        
        print(list)


        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].name
        
        
        if list[indexPath.row].checked == true {
            cell.backgroundColor = .green

        } else {
            cell.backgroundColor = .red
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        pressed = true
        
        if list[indexPath.row].checked {
            self.list[indexPath.row].checked = pressed
            
        }
    }
    
    
    
    @IBAction func switchAction(_ sender: Any) {
        donateInteraction()
        
        Shared.cache.lightState = switchOutlet.isOn
        
    }
    
    func donateInteraction() {
        let intent = SwitchLightsIntent()
        intent.suggestedInvocationPhrase = "light"
        intent.lights = ["lights"]
        intent.on = "on"
        intent.off = "off"
        
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.groupIdentifier = Constants.AppGroup
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: %@", error)
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
    
  
    
    
    @IBAction func addButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Lights"
        }
        
        let done = UIAlertAction(title: "Done", style: .default) { (_) in
            if alertController.textFields?.first?.text != "" {
                var lightName = alertController.textFields!.first!.text!
                self.list.append((name: lightName, checked: self.pressed))
                self.list = Shared.cache.lightStates 
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(done)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
        
        
    }
    
}


