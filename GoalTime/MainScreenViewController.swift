//
//  MainScreenViewController.swift
//  GoalTime
//
//  Created by Дмитрий Соломаха on 04.01.2025.
//

import UIKit

class MainScreenViewController: UIViewController {
    weak var coordinator: Coordinator?
    let tabBarView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        let customColor = UIColor(named: "backgroundColor")
        view.backgroundColor = customColor
        
        view.addSubview(tabBarView)
        tabBarView.backgroundColor = .quaternarySystemFill
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.layer.cornerRadius = 30
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            tabBarView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            tabBarView.heightAnchor.constraint(equalToConstant: 60),
            tabBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}
