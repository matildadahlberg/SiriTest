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
import IntentsUI


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var list = Shared.cache.devices
    var valueToPass: Device?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var lightName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.register(UINib(nibName: "customCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { [weak self] _ in
            print("app did become active notification received")
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.label.text = list[indexPath.row].name
        cell.switchOutlet.isOn = list[indexPath.row].isOn
        
                if Shared.cache.devices[indexPath.row].isOn == true {
        
                    cell.switchOutlet.isOn = true
        
                } else {
                    cell.switchOutlet.isOn = false
                }
        
        cell.switchOutlet.tag = indexPath.row
        cell.switchOutlet.addTarget(self, action: #selector(self.switchState(_:)), for: .valueChanged)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
           
            self.list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)

//            Shared.cache.removeObject(forKey: "devices")
            
            Shared.cache.devices = list
     
            print("Deleted")
            tableView.reloadData()
        }
    }
    
   
    
  

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("You selected cell \(indexPath.row)!")
        
        valueToPass = list[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue") {
            let viewController = segue.destination as! SiriButtonViewController
            viewController.device = valueToPass!
        }
    }
    
    
    

    
    func donateInteraction(device: Device) {
        let intent = SwitchLightsIntent()
        intent.suggestedInvocationPhrase = "Turn on the light"
        intent.powerState = device.isOn ? .on : .off
        intent.deviceName = device.name
        
        print("donating intent \(intent)")
        
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
            textfield.placeholder = "Device.."
        }
        
        let done = UIAlertAction(title: "Done", style: .default) { (_) in
            if alertController.textFields?.first?.text != "" {
                self.lightName = alertController.textFields!.first!.text!
                self.list.append(Device(name: self.lightName, isOn: false))
                
                
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
    
    @objc func switchState(_ sender : UISwitch){
        
        var aDevice = Shared.cache.devices[sender.tag]
        
        aDevice.isOn = !aDevice.isOn
        donateInteraction(device: aDevice)
        
        Shared.cache.devices[sender.tag] = aDevice
        
    }
    
  
   
}

