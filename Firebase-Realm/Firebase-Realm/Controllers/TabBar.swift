//
//  TabBar.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class TabBar: UITabBarController {
    
    let controllers = UITabBarController()
    let firstVC = UINavigationController(rootViewController: HomePageViewController())
    let secondVC = UINavigationController(rootViewController: ChatsPageViewController())
    let thirdVC = UINavigationController(rootViewController: CameraViewController())
    let fourthVC = UINavigationController(rootViewController: SettingsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        view.backgroundColor = .white
    }
    func setupViewControllers() {
        let vcIcons = [
            UIImage(named: "home"),
            UIImage(named: "chat"),
            UIImage(named: "camera"),
            UIImage(systemName: "gearshape")
        ]
        firstVC.title = ""
        secondVC.title = ""
        thirdVC.title = ""
        fourthVC.title = ""
        
        setViewControllers([firstVC, secondVC, thirdVC, fourthVC], animated: true)
        tabBar.tintColor = #colorLiteral(red: 0.3955827355, green: 0.7141469717, blue: 0.6785815358, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.7472824454, green: 0.7472824454, blue: 0.7472824454, alpha: 1)
        
        guard let icons = self.tabBar.items else { return }
        for icon in 0...3 {
            icons[icon].image = vcIcons[(icon)]
        }
    }
}
