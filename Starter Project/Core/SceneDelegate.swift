//
//  SceneDelegate.swift
//  Starter Project
//
//  Created by Ahmed M. Hassan on 26/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let rootcontroller = HomeViewController()
        let window = UIWindow(windowScene: windowScene)
        let navgationController = UINavigationController(rootViewController: rootcontroller)
        window.rootViewController = navgationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

