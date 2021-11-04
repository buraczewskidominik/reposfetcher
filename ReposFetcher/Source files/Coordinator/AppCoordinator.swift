//
//  AppCoordinator.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import UIKit
import SafariServices

/// A coordinator for core app navigation.
final class AppCoordinator: Coordinator {
    
    // MARK: Private properties
    
    private let window: UIWindow
    private let appDependencies: AppDependencies
    
    private var currentViewController: UIViewController?
    
    /// Initialize an AppCoordinator for the given window.
    ///
    /// - Parameters:
    ///   - window: The window for the coordinator to use.
    ///   - appDependencies: The app dependencies container.
    init(
        window: UIWindow,
        appDependencies: AppDependencies
    ) {
        self.window = window
        self.appDependencies = appDependencies
        window.makeKeyAndVisible()
    }
    
    func start() {
        showReposList()
    }
    
    private func showReposList() {
        let reposListViewController = ReposListViewController()
        currentViewController = reposListViewController
        reposListViewController.delegate = self
        let reposListViewModel = ReposListViewModel(reposFetchService: appDependencies.repoFetchService)
        reposListViewController.viewModel = reposListViewModel
        window.rootViewController = reposListViewController
    }
    
    private func displayRepo(_ link: URL?) {
        guard let url = link else { return }
        let safariViewController = SFSafariViewController(url: url)
        currentViewController?.present(safariViewController, animated: true)
    }
}

// MARK: ReposListViewControllerDelegate methods

extension AppCoordinator: ReposListViewControllerDelegate {
    func didChooseRepo(_ repoLink: URL?) {
        displayRepo(repoLink)
    }
}
