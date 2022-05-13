//
//  LobbyViewController.swift
//  sin_13_techmon
//
//  Created by 菊地英治 on 2022/05/12.
//

import UIKit

class LobbyViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staminaLabel: UILabel!
    
    let techMonManager = TechMonManager.shared
    
    var stamina: Int = 100
    var staminaTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "勇者"
        staminaLabel.text = "\(stamina) / 100"
        // Do any additional setup after loading the view.
        staminaTimer = Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector: #selector(updateStaminaValue),
            userInfo: nil,
            repeats: true)
        staminaTimer.fire()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        techMonManager.stopBGM()
    }
    @IBAction func toBattle(){
        
        if stamina >= 50 {
            stamina -= 50
            staminaLabel.text = "\(stamina) / 100 "
            performSegue(withIdentifier: "toBattle", sender: nil)
    } else {
        
        let alert = UIAlertController(
            title: "バトルに行けません",
            message: "スタミナを貯めてください",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
        present(alert,animated: true, completion: nil)
        }
    }
    @objc func updateStaminaValue(){
        if stamina < 100 {
        stamina += 1
        staminaLabel.text  = "\(stamina) / 100"
        }
    }

}
