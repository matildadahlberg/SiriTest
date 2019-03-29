//
//  SiriButtonViewController.swift
//  Siri Test
//
//  Created by Matilda Dahlberg on 2019-03-29.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import UIKit
import Intents
import IntentsUI

class SiriButtonViewController: UIViewController {

    @IBOutlet weak var deviceName: UILabel!
    
    @IBOutlet weak var buttonviewOn: UIView!
    
    @IBOutlet weak var buttonviewOff: UIView!
    
    var device : Device?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { [weak self] _ in
            print("app did become active notification received")
        }

        deviceName.text = device?.name
        addSiriButton(to: buttonviewOn)
        siriButton(to: buttonviewOff)
    }
    override func viewDidAppear(_ animated: Bool) {
        print(device?.isOn)
        
    }
    

    func addSiriButton(to view: UIView) {
        let button = INUIAddVoiceShortcutButton(style: .whiteOutline)
   
        button.shortcut = INShortcut(intent: intent)
        button.delegate = self
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        buttonviewOn.addSubview(button)
        buttonviewOn.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        buttonviewOn.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
    }
    
    func siriButton(to view: UIView) {
        let button = INUIAddVoiceShortcutButton(style: .blackOutline)
        
        button.shortcut = INShortcut(intent: intents)
        button.delegate = self
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        buttonviewOff.addSubview(button)
        
        buttonviewOff.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        buttonviewOff.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        
    }

}

extension SiriButtonViewController {
    public var intent: SwitchLightsIntent {
        let testIntent = SwitchLightsIntent()
        testIntent.deviceName = device?.name
        testIntent.powerState = .on
        testIntent.suggestedInvocationPhrase = "Turn on the \(device!.name)"
        return testIntent
    }
}
extension SiriButtonViewController {
    public var intents: SwitchLightsIntent {
        let testIntent = SwitchLightsIntent()
        testIntent.deviceName = device?.name
        testIntent.powerState = .off
        testIntent.suggestedInvocationPhrase = "Turn off the \(device!.name)"
        return testIntent
    }
}



extension SiriButtonViewController: INUIAddVoiceShortcutButtonDelegate {
    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        addVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        editVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension SiriButtonViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

extension SiriButtonViewController: INUIEditVoiceShortcutViewControllerDelegate {
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
