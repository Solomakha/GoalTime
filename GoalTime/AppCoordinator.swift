import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = MainScreenViewController()
        mainVC.coordinator = self
        navigationController.pushViewController(mainVC, animated: true)
    }
    
}
