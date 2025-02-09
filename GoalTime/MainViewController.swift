import UIKit

class MainViewController: UIViewController {
    weak var coordinator: Coordinator?
    let tabBarView = UIView()
    var customTabBarController: CustomTabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraints()
        if customTabBarController != nil {
            setupCustomTabBar()
        }
    }
    
    func setupView(){
        let customBackgroundColor = UIColor(named: "backgroundColor")
        view.backgroundColor = customBackgroundColor
        
        view.addSubview(tabBarView)
        tabBarView.backgroundColor = .quaternarySystemFill
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.layer.cornerRadius = 30
        tabBarView.clipsToBounds = true
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            tabBarView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            tabBarView.heightAnchor.constraint(equalToConstant: 60),
            tabBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setupCustomTabBar() {
        guard let customTabBarController = customTabBarController else { return }
        
        addChild(customTabBarController)
        view.addSubview(customTabBarController.view)
        customTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        customTabBarController.didMove(toParent: self)
        
        tabBarView.addSubview(customTabBarController.tabBar)
        customTabBarController.tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTabBarController.view.topAnchor.constraint(equalTo: view.topAnchor),
            customTabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabBarController.view.bottomAnchor.constraint(equalTo: tabBarView.topAnchor),
            
            customTabBarController.tabBar.leadingAnchor.constraint(equalTo: tabBarView.leadingAnchor),
            customTabBarController.tabBar.trailingAnchor.constraint(equalTo: tabBarView.trailingAnchor),
            customTabBarController.tabBar.topAnchor.constraint(equalTo: tabBarView.topAnchor),
            customTabBarController.tabBar.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor)
        ])
        
    }
}
