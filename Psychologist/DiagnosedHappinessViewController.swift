//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by lgn on 2018/8/22.
//  Copyright © 2018年 All rights reserved.
//

import UIKit

//实现控制器的多态性
class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    
    //本地缓存
    private let defaults = UserDefaults.standard
    
    //var diagnosticHistory = [Int]()
    var diagnosticHistory: [Int] {
        get {
            return defaults.object(forKey: History.DefaultsKey) as? [Int] ?? []
        }
        set {
            defaults.setValue(newValue, forKey: History.DefaultsKey)
        }
    }
    
    override var happiness: Int {
        didSet {//父didSet执行，后执行这里
            diagnosticHistory += [happiness]
        }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnoseHappinessViewController.History"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
//                if let tvc = segue.destination as? TextViewController {
//                    tvc.text = "\(diagnosticHistory)"
//                }
                if let tvc = segue.destination as? TextViewController {
                    //popOver处理
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none//iphone中不要全屏
    }
    
}
