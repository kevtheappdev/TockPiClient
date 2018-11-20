//
//  ViewController.swift
//  Tock Pi Client
//
//  Created by Kevin Turner on 11/20/18.
//  Copyright © 2018 Kevin Turner. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    @IBOutlet weak var ipAddressInput: UITextField!
    private var isConnected : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alarmTimePicker.isEnabled = false
        let rpiAddress = UserDefaults.standard.string(forKey: "address") ?? "127.0.0.1"
        connectRpi(atAddress: rpiAddress)
    }
    
    private func connectRpi(atAddress rpiAddress: String) {
        Alamofire.request("http://\(rpiAddress)/connect").responseJSON {response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
        }
    }

    @IBAction func connectButtonPressed(_ sender: Any) {
        print("connect button pressed")
        let rpiAddress = self.ipAddressInput.text! // Yuck! Fix this
        connectRpi(atAddress: rpiAddress)
        
    }
    
}

