//
//  TabBarViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/29.
//

import UIKit
class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    
    var tabOne: ViewController!
    var tabTwo: SearchViewController!
    var tab3: AddBookViewController!
    var tab4: HeartViewController!
    var tab5: UserInfoViewController!
    
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
//        tabOne = ViewController()
        let tabOneBarItem = UITabBarItem(title: "홈" ,image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // SearchTab
        let tabTwo = UINavigationController(rootViewController: SearchViewController())
//        tabTwo = SearchViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass",withConfiguration: UIImage.SymbolConfiguration(weight: .bold)))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // contents view
        
//        let tab3 = UINavigationController(rootViewController: AddBookViewController())
        // for present modal
        tab3 = AddBookViewController()
        let tab3Item = UITabBarItem(title: "기록하기", image: UIImage(systemName: "plus"), selectedImage: UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)))

        tab3.tabBarItem = tab3Item
                
        let tab4 = UINavigationController(rootViewController: HeartViewController())
        
//        tab4 = HeartViewController()
        let tab4Item = UITabBarItem(title: "하트", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))

        tab4.tabBarItem = tab4Item
        
        
        let tab5 = UINavigationController(rootViewController: UserInfoViewController())
//        tab5 = UserInfoViewController()
        let tab5BarItem = UITabBarItem(title: "내 정보" , image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        tab5.tabBarItem = tab5BarItem
        
        // 투명도
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = CustomColor().defaultBackgroundColor
        UITabBar.appearance().tintColor = .systemPink
        
        self.viewControllers = [tabOne, tabTwo, tab3, tab4, tab5]
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      if viewController.isKind(of: AddBookViewController.self) {
         let vc =  AddBookViewController()
         vc.modalPresentationStyle = .fullScreen
         self.present(vc, animated: true, completion: nil)
         return false
      }
      return true
    }
}
