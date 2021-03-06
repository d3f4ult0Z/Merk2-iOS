//
//  TabBarHome.swift
//  Merk2
//
//  Created by Adrian Jacobo on 13/10/21.
//

import UIKit

class TabBarHome: UITabBarController {

    var controllers: Array<UIViewController> = Array()
    var shop:UIViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shop = ShopProductsRouter.createModule()
        shop.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "caremply")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "carfull")?.withRenderingMode(.alwaysOriginal))
        controllers.append(shop)

        let search = SearchRouter.createModule()
        search.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_searchemply")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_searchfull")?.withRenderingMode(.alwaysOriginal))
        controllers.append(search)
        
        let home = HomeProductsRouter.createModule()
        home.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_homeemply")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_homefull")?.withRenderingMode(.alwaysOriginal))
        controllers.append(home)
        
        let profile = ProfileRouter.createModule()
        profile.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_profileemply")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_profilefull")?.withRenderingMode(.alwaysOriginal))
        controllers.append(profile)
        
        self.viewControllers = self.controllers.map({ controller in
            return UINavigationController(rootViewController: controller)
        })
        
        self.tabBar.tintColor = .init(red: 0, green: 210/255, blue: 175/255, alpha: 1)
        self.tabBar.layer.borderWidth = 1
        self.tabBar.layer.backgroundColor = .init(red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
        self.tabBar.layer.borderColor = .init(red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
        self.tabBar.clipsToBounds = true
//        self.tabBar.frame = self.tabBar.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        selectedIndex = 2
        NotificationCenter.default.addObserver(self, selector: #selector(moveToCart(notification:)), name: NSNotification.Name("MOVERACARRITO"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(countCart(notification:)), name: NSNotification.Name("COUNTCART"), object: nil)
        
        self.countCartFirst()
    }
    
    @objc private final func countCart(notification: Notification){
        countCartFirst()
    }
    
    func countCartFirst(){
        let number = numberOfItems()
        if number == 0{
            self.shop.tabBarItem.badgeValue = nil
        }else{
            self.shop.tabBarItem.badgeValue = "\(number)"
        }
    }
    
    func numberOfItems() -> Int{
        let userDefaults = UserDefaults.standard
        if let shoppingCartData = userDefaults.object(forKey: "shoppingCart") as? Data{
            if let shoppingCart = try? JSONDecoder().decode(ProductsCart.self, from: shoppingCartData){
                return shoppingCart.cart.count
            }
        }
        return 0
    }
    
    @objc private final func moveToCart(notification: Notification){
        self.selectedIndex = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

}
