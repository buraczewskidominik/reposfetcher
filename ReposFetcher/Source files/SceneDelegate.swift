//
//  SceneDelegate.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Properties

    var window: UIWindow?
    
    // MARK: Private properties

    private let appDependencies = AppDependencies()
    private var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        startApp(withWindowScene: windowScene)
    }
    
    private func startApp(withWindowScene windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        appCoordinator = AppCoordinator(
            window: window,
            appDependencies: appDependencies
        )
        appCoordinator?.start()
    }
}
