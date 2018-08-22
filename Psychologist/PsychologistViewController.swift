//
//  ViewController.swift
//  Psychologist
//
//  Created by lgn on 2018/8/22.
//  Copyright © 2018年 All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    @IBAction func nothing(_ sender: UIButton) {
        performSegue(withIdentifier: "nothing", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination 
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController!
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad": hvc.happiness = 0
                case "happy": hvc.happiness = 100
                case "nothing": hvc.happiness = 25
                default: hvc.happiness = 50
                }
            }
        }
    }


}

