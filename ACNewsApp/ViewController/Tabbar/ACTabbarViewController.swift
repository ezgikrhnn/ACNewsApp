//
//  ACTabbarViewController.swift
//  ACNewsApp
//
//  Created by Ezgi Karahan on 8.05.2024.
//

import UIKit

class ACTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabs()
        customizeTabBar()
        self.tabBar.itemPositioning = .fill
    }
    
    private func setUpTabs(){
        let newsViewModel = ACNewsViewViewModel()
        let discoverViewModel = DiscoverViewViewModel()
        
        let defaultCategory = String()
        
        let newsPageVC =  ACNewsViewController(viewModel: newsViewModel )
        let discoverPageVC = DiscoverViewController(viewModel: discoverViewModel, category: defaultCategory)
        let savePageVC = SaveViewController()
        let settingsPageVC = ACSettingsViewController()
        
        newsPageVC.title = "News"
        discoverPageVC.title = "Discover"
        savePageVC.title = "Favs"
        settingsPageVC.title = "Settings"
        
        let nav1 = UINavigationController(rootViewController: newsPageVC)
        let nav2 = UINavigationController(rootViewController: discoverPageVC)

        let nav3 = UINavigationController(rootViewController: savePageVC)
        let nav4 = UINavigationController(rootViewController: settingsPageVC)
        
        nav1.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "house.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(systemName: "safari"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Save", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        
        
        //setViewController = tab bar'ın içeriklerini yönetmek için kullanılır.
        setViewControllers(
            [nav1,nav2, nav3, nav4],
            animated: true)
    }
    
    private func customizeTabBar() {
            if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .systemBackground  // Sabit arka plan rengi

                tabBar.standardAppearance = appearance
                tabBar.scrollEdgeAppearance = appearance
            } else {
                tabBar.barTintColor = .systemBackground
            }

            tabBar.tintColor = UIColor(named: "LightRed")
            //tabBar.unselectedItemTintColor = UIColor(named: "LightRed")
            tabBar.layer.masksToBounds = true
        }
}
