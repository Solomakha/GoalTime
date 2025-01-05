import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainScreenVC = MainViewController()
        mainScreenVC.coordinator = self
        
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
        
        mainScreenVC.customTabBarController = tabBarCoordinator.customTabBarController
        
        navigationController.pushViewController(mainScreenVC, animated: true)
    }
    
}
