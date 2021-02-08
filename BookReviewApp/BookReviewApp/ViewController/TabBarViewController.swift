//
//  TabBarViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/29.
//

import UIKit
class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBars()
        
    }
    
    func setupTabBars() {
        // main View
        let tabOne = UINavigationController(rootViewController: ViewController())
        let tabOneBarItem = UITabBarItem(title: "홈" ,image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // SearchTab
        
        let tabTwo = UINavigationController(rootViewController: SearchViewController())
        
//        let boldIcon = UIImage.SymbolConfiguration(weight: .bold)
        
        let tabTwoBarItem2 = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass",withConfiguration: UIImage.SymbolConfiguration(weight: .bold)))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // contents view
        
        let tab3 = UINavigationController(rootViewController: AddBookViewController())
        let tab3Item = UITabBarItem(title: "기록하기", image: UIImage(systemName: "plus"), selectedImage: UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)))

        tab3.tabBarItem = tab3Item
        
        
        let tab4 = UINavigationController(rootViewController: HeartViewController())
        let tab4Item = UITabBarItem(title: "하트", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))

        tab4.tabBarItem = tab4Item
        
        
        let tab5 = UINavigationController(rootViewController: UserInfoViewController())
        let tab5BarItem = UITabBarItem(title: "내 정보" , image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        tab5.tabBarItem = tab5BarItem
        
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().tintColor = .systemPink
        
        self.viewControllers = [tabOne, tabTwo, tab3, tab4, tab5]
        
    }
    
    
    // UITabBarControllerDelegate method
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print(self.viewControllers)
//    }
    
    
}

extension TabBarViewController {
    
}
