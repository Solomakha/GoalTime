//
//  CustomTabBarController.swift
//  GoalTime
//
//  Created by Дмитрий Соломаха on 05.01.2025.
//

import UIKit

class CustomTabBarController: UIViewController {
    let tabBar = UITabBar()
    var viewControllers: [UIViewController] = []
    var selectedIndex: Int = 0 {
        didSet {
            showSelectedViewController()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        showSelectedViewController()
    }

    private func setupTabBar() {
        view.addSubview(tabBar)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 60)
        ])
        tabBar.delegate = self
    }

    private func showSelectedViewController() {
        for (index, vc) in viewControllers.enumerated() {
            if index == selectedIndex {
                addChild(vc)
                vc.view.frame = view.bounds
                view.insertSubview(vc.view, belowSubview: tabBar)
                vc.didMove(toParent: self)
            } else {
                vc.willMove(toParent: nil)
                vc.view.removeFromSuperview()
                vc.removeFromParent()
            }
        }
    }
}

extension CustomTabBarController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            selectedIndex = index
        }
    }
}
