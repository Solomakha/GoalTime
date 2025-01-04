//
//  MainScreenViewController.swift
//  GoalTime
//
//  Created by Дмитрий Соломаха on 04.01.2025.
//

import UIKit

class MainScreenViewController: UIViewController {

    weak var coordinator: Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let customColor = UIColor(named: "backgroundColor") {
            view.backgroundColor = customColor
        } else {
            view.backgroundColor = UIColor.systemBlue // Fallback color
        }
        // Do any additional setup after loading the view.
    }
    
}
