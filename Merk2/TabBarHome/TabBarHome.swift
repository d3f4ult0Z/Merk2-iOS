//
//  TabBarHome.swift
//  Merk2
//
//  Created by Adrian Jacobo on 13/10/21.
//

import UIKit

class TabBarHome: UITabBarController {

    private var controllers: Array<UIViewController> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let search = SearchRouter.createModule()
        search.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "back_arrow")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_login")?.withRenderingMode(.alwaysOriginal))
        controllers.append(search)
        
        let home = HomeProductsRouter.createModule()
        home.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "back_arrow")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_login")?.withRenderingMode(.alwaysOriginal))
        controllers.append(home)
        
        let profile = ProfileRouter.createModule()
        profile.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "back_arrow")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_login")?.withRenderingMode(.alwaysOriginal))
        controllers.append(profile)
        
        self.viewControllers = self.controllers.map({ controller in
            return UINavigationController(rootViewController: controller)
        })
        
        self.tabBar.tintColor = .red
        self.tabBar.layer.borderWidth = 1.0
        self.tabBar.layer.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        self.tabBar.layer.borderColor = .init(red: 0, green: 0, blue: 1, alpha: 1)
        self.tabBar.clipsToBounds = true
        
        selectedIndex = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

}

//private extension UITabBar {
//    var tabBarButtons: [UIView] {
//        let buttons = self.subviews.filter { $0.isTabBarButton }
//        return buttons.sorted(by: { $0.frame.origin.x < $1.frame.origin.x })
//    }
//    
//    var badgeViews: [UIView?] {
//        self.tabBarButtons.map { $0.badgeView }
//    }
//}
