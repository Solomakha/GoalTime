import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let customTabBarController: CustomTabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.customTabBarController = CustomTabBarController()
    }
    
    func start() {
        customTabBarController.viewControllers = createTabViewControllers()
        customTabBarController.tabBar.items = createTabItems()
        customTabBarController.selectedIndex = 0
    }
    
    private func createTabViewControllers() -> [UIViewController] {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Головна", image: UIImage(systemName: "house"), tag: 0)
        
        let profileVC = LeaguesViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Ліги", image: UIImage(systemName: "person"), tag: 1)
        
        return [homeVC, profileVC]
    }
    
    private func createTabItems() -> [UITabBarItem] {
        return customTabBarController.viewControllers.map { $0.tabBarItem! }
    }
}
