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

    
    var list = Shared.cache.devices
    
    var state = CustomCell()
 
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    
    
//    var pressed = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "customCell", bundle: nil), forCellReuseIdentifier: "cell")
        
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
            list = Shared.cache.devices
    
            print(Shared.cache.devices)
            print(list)
        
        tableView.reloadData()
        
//        switchOutlet.isOn = Shared.cache.lightState

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell


        cell.label.text = list[indexPath.row].name
        cell.switchOutlet.isOn = list[indexPath.row].isOn
        
        if cell.switchOutlet.isOn == true {
            donateInteraction()

        }
        return cell
    }
    
    
    
    
    @IBAction func switchAction(_ sender: Any) {
        donateInteraction()
        
//        Shared.cache.lightState = switchOutlet.isOn
        
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
                let lightName = alertController.textFields!.first!.text!
                self.list.append(Device(name: lightName, isOn: self.switchOutlet.isOn))
                Shared.cache.devices = self.list
                self.tableView.reloadData()
                print(self.list)
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


