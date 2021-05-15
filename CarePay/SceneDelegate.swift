//
//  SceneDelegate.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/28/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            window = UIWindow(frame: UIScreen.main.bounds)
            guard let windowScence = (scene as? UIWindowScene) else { return }
            window?.windowScene = windowScence
            let mainVC = setupTabarController()
        

            window?.rootViewController = mainVC
            window?.makeKeyAndVisible()
     
    }
    func setupTabarController () -> UITabBarController{
        

    let tabBC = UITabBarController()
        let homeVC = HomeViewController()
        let homeNavigation = UINavigationController(rootViewController: homeVC)
        homeNavigation.navigationBar.tintColor = UIColor.orange
//        homeNavigation.isNavigationBarHidden = true
        homeVC.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let dealVC = DealViewController()
        let dealNavigation = UINavigationController(rootViewController: dealVC)
//        dealNavigation.isNavigationBarHidden = false
        dealVC.tabBarItem = UITabBarItem(title: "Giao dịch", image: UIImage(systemName: "doc.text"), selectedImage: UIImage(systemName: "doc.text.fill"))
        
        let messVC = MessengerViewController()
        let messNavigation = UINavigationController(rootViewController: messVC)

        messVC.tabBarItem = UITabBarItem(title: "Thông báo", image: UIImage(systemName: "bell"), selectedImage: UIImage(systemName: "bell.fill"))
        
        
        let accountVC = AccountViewController()
        let accNavigation = UINavigationController(rootViewController: accountVC)

        accountVC.tabBarItem = UITabBarItem(title: "Tài khoản", image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)
        
        tabBC.setViewControllers([homeNavigation , dealNavigation, messNavigation, accNavigation ], animated: true)
        
        
        return tabBC
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    


}

