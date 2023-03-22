//
//  SceneDelegate.swift
//  PokerGameApp
//
//  Created by Noah on 2023/03/13.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene
        else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = PokerBoardViewController(cardsPerRow: 7, numberOfCards: 7)
        window.makeKeyAndVisible()
        self.window = window
    }
}
